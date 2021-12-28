$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.18.1/TIB_js-studiocomm_6.18.1_windows_x86_64.exe'
  checksum64     = '7b7777793a1ebd144c6df07d03d3a2bee6e38b02d4ecca28109bafec58de6921'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
