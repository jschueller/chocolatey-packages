$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'b58b974557fb32aaf23096c306990523b27080ded6de5d30846246124dad672cdc514ab732bd6a32f030a83f15d49b2e879de8bfb3f7e99d7f18ba150eab2375'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
