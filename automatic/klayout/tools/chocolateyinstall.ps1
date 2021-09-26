$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.4-win32-install.exe'
  checksum      = '1a34f5ed687ef6123d60b6afe27a7466f789284a1f2956bb77280076d078b720'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.4-win64-install.exe'
  checksum64    = 'a4ed561757ba44ae7c389a33eadb7c0b68c1d5b0c91d4df14946214edf4c7638'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
