$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen_Setup.exe'
  checksum     = '2dddbbf41fece57eb9e24269642a10d23a50844bf8a3e2e4617f97ad78acdd3f'
  checksumType = 'sha256'

  silentArgs   = '-q'
}

Install-ChocolateyPackage @packageArgs
