﻿import-module au

function global:au_GetLatest {
    $github_repository = "GNS3/gns3-gui"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex   = $github_repository + '/releases/download/.*/GNS3-(?<Version>[\d\.]*)[\w-]*.exe'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	
	$url = $download_page.links | ? href -match $regex

    return @{ Version = $matches.Version ; URL32 = "https://github.com" + $url.href }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"               = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"               = "`${1}$($Latest.URL32)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
            "(https://raw.githubusercontent.com/GNS3/gns3-gui/v)[\d\.]+(/LICENSE)" = "`$1$($Latest.Version)`$2"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
        }

        "tools\chocolateyinstall.ahk" = @{
            "(^\s*GNS_Version\s*=\s)*" = "`$1$($Latest.Version)"
        }

        "tools\chocolateyuninstall.ahk" = @{
            "(^\s*GNS_Version\s*=\s)*" = "`$1$($Latest.Version)"
        }

         "$($Latest.PackageName).nuspec" = @{
            "(\<licenseUrl\>https://raw.githubusercontent.com/GNS3/gns3-gui/v)[\d\.]+(/LICENSE\</licenseUrl\>)" = "`$1$($Latest.Version)`$2"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}