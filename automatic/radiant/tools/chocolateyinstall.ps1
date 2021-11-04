$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2021.2-Setup.exe'
  checksum      = '66ace6592ac9d22a7ad1d9bf209bba37797cfc935f5082933b00431a41ff1a2c'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
