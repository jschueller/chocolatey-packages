$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://rambax.com/simpletransfer/desktop/SimpleTransfer%20Desktop%20Setup%203.2.3.exe'
  checksum      = 'd3a44cb6702532c7a1915fba8fed6528eb673c1e4b79096aa5bf1bc8240889a1'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
