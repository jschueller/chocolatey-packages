$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.7-win32-install.exe'
  checksum      = '657e6db058b1e2548c67a0367f34ab517757e3c6a30b835743e6ad0c9157823f'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.7-win64-install.exe'
  checksum64    = 'be7d5eed482588be195c0b76fc839f40bd409141efa1c7cef99f18596b837320'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
