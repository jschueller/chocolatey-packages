$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen_Setup.exe'
  checksum     = 'a0e859821b1cdbb173616b821900b2bf3d95387815adf94ea196e4309decae78'
  checksumType = 'sha256'

  silentArgs   = '-q'
}

Install-ChocolateyPackage @packageArgs
