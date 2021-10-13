$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '2feb79b6fe343f8148fa7ddf0b0dac05549252d1aacc6283e837cf674c581759ad9bc180e8250d66edf37e29ebb20de4fd7fdd486630010d43bc95c03c097743'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
