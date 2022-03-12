import-module au

function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {	
    $github_repository = 'marktext/marktext'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'
    $regex32  = '/.*-ia32-win.zip'
    $regex64  = '/v(?<Version>[\d\.]*)/.*-x64-win.zip'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	
	$url32 = $download_page.links | ? href -match $regex32
    $url64 = $download_page.links | ? href -match $regex64

    return @{
        Version = $matches.Version
        URL32 = 'https://github.com' + $url32.href
        URL64 = 'https://github.com' + $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*url32\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
            "(^(\s)*checksum32\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"
        }        
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none -noCheckUrl
}