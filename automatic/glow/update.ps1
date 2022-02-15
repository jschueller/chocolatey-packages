import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = 'charmbracelet/glow'
    $releases = 'https://github.com/'' + $github_repository + "/releases/latest"    
    $regex32  = 'glow_.*_i386.zip'
    $regex64  = 'glow_(?<Version>[\d\.]*).*_x86_64.zip'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url32 = $download_page.links | ? href -match $regex32
    $url64 = $download_page.links | ? href -match $regex64
    $version = $matches.Version
    
    return @{
        Version = $matches.Version
        URL32 = 'https://github.com' + $url32.href
        URL64 = 'https://github.com' + $url64.href
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""          
        }
    }
}

update -ChecksumFor none