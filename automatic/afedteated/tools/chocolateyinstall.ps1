$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '7f80cd2249459a0f181e7b608d4dc112e18dfae20305f05ce9c3442ce641e5f571ebc0b96dbac6591579ec17b9077d9fe86c89a8b471d2d795e6b9b38cde4854'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
