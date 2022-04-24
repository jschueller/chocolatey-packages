$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.9-win32-install.exe'
  checksum      = 'fabb30ceba178e42f2482da4bbca3af0ef4d72a3cf71f9cf7bc91469e7bc5c0e'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.8-win64-install.exe'
  checksum64    = '0eade674ed148d631916ad73b739eb139d12824df2f74f24a3fce3a4dae43de3'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
