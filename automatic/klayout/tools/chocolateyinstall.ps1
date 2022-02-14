$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.8-win32-install.exe'
  checksum      = '8573b36f623db7a322f8a182a3e0a4e5ac786c9e3fcd04b0559e096d4e169d5b'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.8-win64-install.exe'
  checksum64    = '0eade674ed148d631916ad73b739eb139d12824df2f74f24a3fce3a4dae43de3'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
