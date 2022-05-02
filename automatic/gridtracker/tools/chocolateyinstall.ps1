$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://storage.googleapis.com/gt_download/v1.22.0502/GridTracker-Installer.1.22.0502.exe'
  checksum     = '940aeb5dbe201d9b2630e774f2867de93c1379b5561bc372a6de00216b59ef24'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
