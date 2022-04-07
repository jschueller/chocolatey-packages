$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://rambax.com/simpletransfer/desktop/SimpleTransfer%20Desktop%20Setup%203.2.4.exe'
  checksum      = '911b77f45e243d8eac2f0aeb2c8fb431970884ee0b4f0f2008d5aa59bed8f387'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
