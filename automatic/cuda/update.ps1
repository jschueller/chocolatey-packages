import-module au

function global:au_GetLatest {
    $releases = 'https://developer.nvidia.com/cuda-downloads'
    # $regex    = '(/(?<MajorVersion>[\d\.]+)\\?(/Prod)?\\?/local_installers\\?/(?<File>cuda_(?<VersionMajor>[\d\.]+)_(?<VersionMinor>[\d\.]+)_win10.exe))'
    # cuda_11.6.0_511.23_windows.exe
    #https:\/\/developer.download.nvidia.com\/compute\/cuda\/11.6.0\/local_installers\/cuda_11.6.0_511.23_windows.exe\u0022
    $regex    = '(/(?<MajorVersion>[\d\.]+)\\?(/Prod)?\\?/local_installers\\?/(?<File>cuda_(?<VersionMajor>[\d\.]+)_(?<VersionMinor>[\d\.]+)_windows.exe))'
    
    (Invoke-WebRequest -Uri $releases -UseBasicParsing).RawContent -match $regex | Out-Null

    return @{
        Version = $matches.VersionMajor + '.' + ($matches.VersionMinor -replace '\.','')
        URL32   = 'https://developer.download.nvidia.com/compute/cuda' + $matches.0 -Replace '\\',''
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }
    }
}

update -NoCheckUrl