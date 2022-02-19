import-module au

function global:au_BeforeUpdate {
  Get-RemoteFiles -NoSuffix -Purge
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
	$releases = 'https://kid3.kde.org'
  $regex64  = 'kid3-(?<Version>[\d\.]+)-win32-x64.zip'
	# $regex32  = 'kid3-([\d\.]+)-win32.zip'

	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  # $download_page.links | ? href -match $regex32 | Out-Null
  # $file32  = $matches.0
	$download_page.links | ? href -match $regex64 | Out-Null
  $file64  = $matches.0
  $version = $matches.Version
  
	return @{
    Version = $version    
    # URL32   = Get-RedirectedUrl ('https://downloads.sourceforge.net/project/kid3/kid3/' + $version + '/' + $file32)
    URL64   = Get-RedirectedUrl ('https://downloads.sourceforge.net/project/kid3/kid3/' + $version + '/' + $file64)
  }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"            
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{          
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
          "([$]toolsDir `"kid3-)[\d\.]+(-win32[$]{architectureWidth}\\kid3.exe)`"" = "`${1}$($Latest.Version)`${2}`""          
        }
    }
}

update -ChecksumFor 64