$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://fleetwood.mchambersradio.com/gridtracker/v1.21.0928/GridTracker-Installer.1.21.0928.exe'
  checksum     = '58c37dfa4b8da47963b85de92d3ad4727d913442b635513d723042224ae16c43'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
