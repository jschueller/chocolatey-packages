$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Release-6-5-3-65658_Setup.exe'
  checksum       = 'f4005e0f41dcb3ab1143e4df057cea533586ae58944ef52bc0084e2bfff1e8aa'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Releasex64-6-5-3-65658_Setup.exe'
  checksum64     = 'b7d94cfd81c6a89b75dab296a86000a222a1271d5d3abb345dd324a249eefd0c'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
