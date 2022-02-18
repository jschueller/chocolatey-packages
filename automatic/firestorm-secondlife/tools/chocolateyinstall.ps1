$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Release-6-4-21-64531_Setup.exe'
  checksum       = 'dfd79f6587fb90c43fcff33a52d2c9c7617abe8d00e243a25906b3955c139bfe'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Releasex64-6-4-21-64531_Setup.exe'
  checksum64     = '207652e0fc69fe7036a7fc1eb0e115c2859c5bcae02b92c989f42cf414ab28f2'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
