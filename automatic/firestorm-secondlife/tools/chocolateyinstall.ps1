$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Release-6-5-3-65658_Setup.exe'
  checksum       = '61b2bb0753482e42be8721fa471b3e7d3388305319ce861fd47243de922258cd'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Releasex64-6-5-3-65658_Setup.exe'
  checksum64     = 'a5ec2529a79c1ddc8c289a2b853a680fc6ff5115ac33e887d8b6b1a53ad409a1'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
