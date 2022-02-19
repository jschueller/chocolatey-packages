$ErrorActionPreference = 'Stop'
Import-Module au

function global:au_GetLatest {    
    $downloadUrl = 'https://static.bandlab.com/assistant/latest.yml'

    $regexVersion = 'version: (?<Version>[\d\.]+)'
    $regexFile = 'path: (?<File>.*)'    

    $download_Page = Invoke-WebRequest -Uri $downloadUrl -UseBasicParsing

    $download_Page -match $regexVersion    
    $version = $matches.Version

    $download_Page -match $regexFile
    $file = $matches.File

    return @{
      Version = $version
      URL32   = 'https://static.bandlab.com/assistant/' + [uri]::EscapeDataString("$file")            
    }
    
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"            
        }
    }
}

update