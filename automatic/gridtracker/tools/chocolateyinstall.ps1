$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://fleetwood.mchambersradio.com/gridtracker/v1.21.1212/GridTracker-Installer.1.21.1212.exe'
  checksum     = '229d63cd8ab5a8de1c444b2a02b9fc8dcc8e36534bc81a1fa3dde0acdca63072'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
