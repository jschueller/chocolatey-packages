$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.19.1/TIB_js-studiocomm_6.19.1_windows_x86_64.exe'
  checksum64     = 'fc16e4a0320fb7b3d3865d7898a9491c8675ac83cab15ff2fdfa8ec632212288'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
