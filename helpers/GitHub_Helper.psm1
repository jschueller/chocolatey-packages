Import-Module ..\..\helpers\GitHub_Helper.psm1

function github_GetInfo {
    Param([array]$ArgumentList)    

    $debug = 0;
    $github_url = 'https://github.com'
    $github_repository_root     = "$github_url" + $ArgumentList.repository
    $github_repository_releases = "$github_repository_root" + '/releases/latest'

    $url32_path = ($download_page.links | ? href -match $ArgumentList.regex | select -Last 1).href

    If ($debug) {
        Write-Host "github_repository_root:" $github_repository_root
        Write-Host "github_repository_releases:" $github_repository_releases
        Write-Host "Regex:" $ArgumentList.regex
        Write-Host "Version:" $matches.Version
        Write-Host "url32_path: " $url32_path
    }

    return @{
        Version = $matches.Version;
        URL32 = $github_url + $url32_path;
    }
}