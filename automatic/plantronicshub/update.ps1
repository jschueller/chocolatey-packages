$ErrorActionPreference = 'Stop'
Import-Module au
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

# [Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate {
    $Latest.ChecksumType32 = 'sha256'
    $Latest.Checksum32     = Get-RemoteChecksum $Latest.URL32 -Algorithm $Latest.ChecksumType32
}

function global:au_GetLatest {  
  $etag = GetETagIfChanged -uri "https://www.poly.com/content/dam/www/software/PlantronicsHubInstaller.exe"

  if ($etag) {        
      $result = GetResultInformation "https://www.poly.com/content/dam/www/software/PlantronicsHubInstaller.exe"
      $result["ETAG"] = $etag
  }
  else {        
    $result = @{
      URL32   = 'https://www.poly.com/content/dam/www/software/PlantronicsHubInstaller.exe'
      Version = Get-Content "$PSScriptRoot\info" -Encoding UTF8 | select -First 1 | % { $_ -split '\|' } | select -Last 1
    }
  }	
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
          "(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
          "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_AfterUpdate {
  "$($Latest.ETAG)|$($Latest.Version)" | Out-File "$PSScriptRoot\info" -Encoding utf8
}

function GetResultInformation([string]$url32) {
  $dest = "$env:TEMP\PlantronicsHubInstaller.exe"
  Get-WebFile $url32 $dest | Out-Null

  $result = @{
    URL32          = $url32    
    Version        = (Get-Item $dest).VersionInfo.FileVersion.Trim()
    Checksum       = Get-FileHash $dest -Algorithm SHA256 | % Hash    
    ChecksumType32 = 'sha256'
  }  
  Remove-Item -Force $dest
  return $result
}

function GetETagIfChanged() {
  param([string]$uri)
  if (($global:au_Force -ne $true) -and (Test-Path $PSScriptRoot\info)) {
    $existingETag = $etag = Get-Content "$PSScriptRoot\info" -Encoding UTF8 | select -First 1 | % { $_ -split '\|' } | select -first 1
  }
  else { $existingETag = $null }

  $etag = Invoke-WebRequest -Method Head -Uri $uri -UseBasicParsing
  $etag = $etag | % { $_.Headers.ETag }
  if ($etag -eq $existingETag) { return $null }

  return $etag
}

update -ChecksumFor none -NoCheckUrl