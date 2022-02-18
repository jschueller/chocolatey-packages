$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Release-6-4-21-64531_Setup.exe'
  checksum       = '5abf16893bdb7deb9c458a33643bf1930af5377d52174093e4dd4953dfb9345a'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Releasex64-6-4-21-64531_Setup.exe'
  checksum64     = 'a2adc053443bc8da473906104f80d81124843536495e481a0feb25be246910ff'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
