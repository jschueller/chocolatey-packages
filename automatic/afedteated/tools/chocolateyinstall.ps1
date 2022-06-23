$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'b8ec28bec31f0a6afb9187decf5fcbd72f16d5d78bde08abe9b1bc1301c52701ffd85d6bfdb32c777dec5d83ea7af9d08d62b051a6c7d5472c8a8f078bb8a9b9'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
