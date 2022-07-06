$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'f84c0c87ad94b1cc64999483fc0eb205cac017181fe0512f4302e722a2e6227e0f3a0c2fba750aeec020d3650c6928c90ce776c4daa6dcfc34b19d8cbb966c2b'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
