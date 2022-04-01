$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '2ad48de373a995d6da5815c34e07eac9c5e7f589601d52f9f3231e279a2a5974313e58cef6abab397abe3efcda933975089e16e4dd106ac673cc53ca21341484'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
