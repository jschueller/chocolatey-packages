import-module au

function global:au_GetLatest {
    return github_GetInfo -ArgumentList @{
        repository = 'NatronGitHub/Natron'        
        regex      = 'Natron-(?<Version>[\d\.]+)-Windows-x86_64.zip'
    }  
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
          "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
          "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"          
        }
    }
}

update -ChecksumFor 64