$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.6-win32-install.exe'
  checksum      = '10c281d1a47b223c4efa5f8472c7279b09f9717769e361876ca5183fbbd12437'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.6-win64-install.exe'
  checksum64    = '2a4c2098a54d8d1f33f879e89c4c2f36e632343ba9e3e51e902bd847091bd46a'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
