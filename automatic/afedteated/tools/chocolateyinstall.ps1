$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '3a72ead46c12a0d748ec946737d0ffa1ec2f18b701bdb09157771d945c9794766aeb73cfe636823e8b487a9560702fdc70aaa8d4fbc2ff662ad42aab4a130289'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
