$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://rambax.com/simpletransfer/desktop/SimpleTransfer%20Desktop%20Setup%203.2.5.exe'
  checksum      = '8f0e8f8e6adc270a1233ca9372a31fe5eb492f1a1f8c8d6d19b63f5e90d38605'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
