$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.18.1/TIB_js-studiocomm_6.18.1_windows_x86_64.exe'
  checksum64     = '3327ca492684456cdcf3a27d1f9c7df9456cf31865e6589a6c1744f9b8ed6985'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
