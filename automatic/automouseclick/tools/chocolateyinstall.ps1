$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.murgee.com/auto-mouse-click/download/setup.exe'
  checksum     = 'F865AE1DFC02ABC600749E40B3FA21D5F51ADB32CF20FF4BE8454C22481255FE'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
