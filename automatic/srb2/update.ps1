Import-Module au
#. ..\..\helpers\GitHub_Helper.ps1
. .\GitHub_Helper.ps1

function global:au_GetLatest {
    return github_GetInfo -ArgumentList @{
        repository = 'STJr/SRB2'
        regex      = 'SRB2_release_(?<Version>[\d\.]+)/SRB2-v\d+-Installer.exe'
        }
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