$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://rambax.com/simpletransfer/desktop/SimpleTransfer%20Desktop%20Setup%203.3.1.exe'
  checksum      = '9a02d4fea2593a2697469eb670db5806f0b9ca734f447569f455464176bd3082'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
