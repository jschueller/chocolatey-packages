$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG12.2.0Setup.exe'
  checksum      = '29f3327128cecf37d9316714f860937b66d33ba954c6ce0ac74270948be01ef7'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
