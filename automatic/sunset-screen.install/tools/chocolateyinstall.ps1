$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen_Setup.exe'
  checksum     = 'cb27332cf2d4461c07241892d919dbb294ca54060896a3f6a2df79b0fe7853d0'
  checksumType = 'sha256'

  silentArgs   = '-q'
}

Install-ChocolateyPackage @packageArgs
