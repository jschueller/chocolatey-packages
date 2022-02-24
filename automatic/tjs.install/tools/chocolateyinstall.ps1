$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.19.0/TIB_js-studiocomm_6.19.0_windows_x86_64.exe'
  checksum64     = '0dc356a604143547d41c650d8da2c533360311d256b93350216b9ce9a5aa879f'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
