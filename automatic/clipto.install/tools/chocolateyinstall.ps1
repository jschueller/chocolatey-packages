$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/clipto-pro/Desktop/releases/download/v7.2.3/clipto-7.2.3.exe'
  checksum     = 'e28e4d51f9323db8752c79e6273b6e6802027778fb34f20291ee47a48955a65e'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
