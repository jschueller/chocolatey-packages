import-module au

function global:au_GetLatest {
	$releases = 'https://rambax.com/simpletransfer/download'
	$regex    = 'SimpleTransfer Desktop Setup (?<Version>[\d\.]+).exe'
	
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$download_page.Content -match $regex
	
    return @{ Version = $matches.Version ; URL32 = 'https://rambax.com' + $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update