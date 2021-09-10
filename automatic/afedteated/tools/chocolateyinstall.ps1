$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'f7334c7d3b99ed6416d30e9e62029cc05c8d9aecbbfaeec760bb08687c22cc327c9b29e9c8d230968f8b970db8e5ccffe2a2259829c49448029c90d22813c5b1'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
