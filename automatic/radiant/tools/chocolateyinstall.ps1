$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2021.2.2-Setup.exe'
  checksum      = 'f0fe9717dc83055e189cfbaf1e4478b85ed3a16a20b3442ecec79af900469f26'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
