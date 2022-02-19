$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://static.bandlab.com/assistant/BandLab%20Assistant%20Setup%2010.2.0.exe'
  checksum      = '6f84887637ef99e2de75891506c668089e0b71d86c3b6f9d6bd14716b35645171b2b5d23941101e868a7a02a865bddd136d4d15864607b219ba126fc0141cc0f'
  checksumType  = 'sha512'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
