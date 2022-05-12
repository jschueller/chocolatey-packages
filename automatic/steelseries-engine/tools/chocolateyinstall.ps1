$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG18.0.0Setup.exe'
  checksum      = 'e9591de74b8736a76b0637ef122ab70f95b2c1b6a107112a3df3f343d7ab2406'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
