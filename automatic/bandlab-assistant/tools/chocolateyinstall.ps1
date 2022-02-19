$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://static.bandlab.com/assistant/BandLab%20Assistant%20Setup%2010.2.0.exe'
  checksum      = '4729bdd35d3913200578152a8d4d47f6eef2f71af0b0fc26d19ff79c56e1c26d'
  checksumType  = 'sha512'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
