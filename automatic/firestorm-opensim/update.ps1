import-module au

function global:au_BeforeUpdate {    
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $releases = 'https://www.firestormviewer.org/windows-for-open-simulator'
    $regex32  = 'Phoenix-FirestormOS-release-(?<Version>[\d-]+)-\d+_Setup.exe'
    $regex64  = 'Phoenix-FirestormOS-releasex64-(?<Version>[\d-]+)-\d+_Setup.exe'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing    
    $url32 = $download_page.links | ? href -match $regex32
    $url64 = $download_page.links | ? href -match $regex64

    return @{
        Version = ($matches.Version).Replace('-','.')
        URL32   = $url32.href
        URL64   = $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"            = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"       = "`${1}'$($Latest.Checksum32)'"            
            "(^(\s)*url64\s*=\s*)('.*')"          = "`${1}'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')"     = "`${1}'$($Latest.Checksum64)'"            
        }
    }
}

update -noCheckUrl -checksumFor none