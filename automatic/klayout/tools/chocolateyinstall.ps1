$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.5-win32-install.exe'
  checksum      = '4fc65ab4fcc867a943c31a4d314aab12a51bd3a7fb22ac44a68749b88c7c4541'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.5-win64-install.exe'
  checksum64    = '198fd2ccd2597efb85fa7463f27cb20c4af00beccd0df39deb396f327986661a'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
