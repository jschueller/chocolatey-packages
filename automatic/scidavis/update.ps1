import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://sourceforge.net/projects/scidavis'
    #<a href="/projects/scidavis/files/latest/download" title="Download scidavis.2.7-win-dist.msi from SourceForge  - 96.8 MB" class="button download big-text green ">
    #https://nav.dl.sourceforge.net/project/scidavis/SciDAVis/2/2.7/scidavis.2.7-win-dist.msi
    #https://downloads.sourceforge.net/project/scidavis/SciDAVis/2/2.7/scidavis.2.7-win-dist.msi
    $regex    = 'scidavis.(?<Version>(?<VersionMajor>[\d]+)\.(?<VersionMid>[\d]+)(\.[\d]+)?)-win-dist.msi'

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null
    $version = $matches.Version

    return @{
      Version = $version
      URL32   = 'https://downloads.sourceforge.net/project/scidavis/SciDAVis/' + $matches.VersionMajor + '/' + $matches.VersionMajor + '.' + $matches.VersionMid + '/' + $matches.0
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
        }
    }
}

update -ChecksumFor none