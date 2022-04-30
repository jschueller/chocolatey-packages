$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG17.1.0Setup.exe'
  checksum      = '6b5287815f149a529a49f924da65b73c3fafe3a0f3976b150db28d5ec0e14beb'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
