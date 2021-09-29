$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/clipto-pro/Desktop/releases/download/v7.2.6/clipto-7.2.6.exe'
  checksum     = '2cf731b72dfc7fc39ef3e76ac83f8cd5748fdbb1db468d4cdfa845220730a84c'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
