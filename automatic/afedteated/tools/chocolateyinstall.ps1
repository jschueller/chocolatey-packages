$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'f8fdd061db2ea22dd653cd2338f1cd521056e82752373634bed3494f463e10831ca7dc6fd106c55f79f03765df3084ff6c8a5b530efba858b47831e555e280c3'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
