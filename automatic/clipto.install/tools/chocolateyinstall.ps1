$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/clipto-pro/Desktop/releases/download/v7.2.17/clipto-7.2.17.exe'
  checksum     = '5258899bfa826096a1484408e6e97cf94c728c44ccef360980ca7f39793cac71'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
