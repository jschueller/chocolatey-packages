$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://fleetwood.mchambersradio.com/gridtracker/v1.21.1217/GridTracker-Installer.1.21.1217.exe'
  checksum     = 'fc25addfb8fcb0949a111d2209910dd12fced1e1bfb3d82faa7ed51a7b7f7f22'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
