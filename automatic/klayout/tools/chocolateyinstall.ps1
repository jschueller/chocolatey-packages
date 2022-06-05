$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.10-win32-install.exe'
  checksum      = 'f67c96596c6cf4efd44a75cd30780711d9f0020b996773ff6f5d8b99ea1b2ab1'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.10-win64-install.exe'
  checksum64    = 'cb98d70bca1cb797a6dd4629d67cf6cdecf6b09c9c62fd490635452751a8ca2e'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
