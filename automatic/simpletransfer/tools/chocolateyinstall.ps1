$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://rambax.com/simpletransfer/desktop/SimpleTransfer%20Desktop%20Setup%203.4.0.exe'
  checksum      = '60f1b7fe647334e5f02e8105c3d9604302813b98a738e9b80bbe92fedfd3477f'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
