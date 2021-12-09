$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG12.0.0Setup.exe'
  checksum      = '55bd63fccf0f1d4500d421421aaef95e288b74eb21f4ec7533615b659d54a271'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
