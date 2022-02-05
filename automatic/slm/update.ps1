import-module au

function global:au_GetLatest {
    $releases = 'https://messenger.softros.com/downloads'
    $regex    = 'Version: (?<Version>[\d\.]+)'
    
    (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null
    $version = $matches.version
    If ($version -notlike '*.*') {
        $version = $version + '.0'
    }
    
    return @{
        Version = $matches.version
        URL32   = 'https://download.softros.com/SoftrosLANMessengerSetup.msi'
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

update