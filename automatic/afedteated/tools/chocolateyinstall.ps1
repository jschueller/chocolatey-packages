$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'fd255cee3445e6a50ba35c7404c50de54dffaad79ac0d8a5f184e4a37a92d0b12c6a9ba1ef60a4ca179450bcc87032afa2492fa346b35d483b5e307b121476f9'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
