$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG15.0.0Setup.exe'
  checksum      = 'fbaa85aec0aa6b2128155398ae812cf3ea99ba73cf1b76d90b76d509a1199541'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
