$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
	#$releases = 'https://www.salome-platform.org/downloads/current-version'
    $releases = 'https://www.salome-platform.org/?page_id=145'
	#$regex    = 'DownloadDistr[?]platform=SP.W10(EXE)?&amp;version=(?<Version>[\d\.]+)'                   
    $regex = 'SALOME-(?<Version>[\d\.]+).zip'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex | select -First 1

    return @{
        Version = $matches.Version
        URL64   = $url.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"            
        }
    }
}

update -noCheckUrl -ChecksumFor 64