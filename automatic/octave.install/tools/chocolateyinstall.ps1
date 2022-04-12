$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://ftpmirror.gnu.org/octave/windows/octave-7.1.0-w32-installer.exe'
  checksum      = '032ea05cfedec618c217159195e35af89145f215641fc752d8430144eef32d62'
  checksumType  = 'sha256'

  url64         = 'https://ftpmirror.gnu.org/octave/windows/octave-7.1.0-w64-installer.exe'
  checksum64    = 'ba67fdd087b09c8c0883a9f5781f54d977782139d0a91608ad0764c9795c42e3'
  checksumType64= 'sha256'

  # Note: silentArgs doesn't work as expected for octave.install
  # An autohotkey is used as workaround.
  # silentArgs	= "/S"
}

# Don't create shims for any executables
$files = Get-ChildItem "$toolsDir"  -Recurse -Include *.exe -Exclude 'octave-cli.exe'
foreach ($file in $files) {
    New-Item "$file.ignore" -type file -force | Out-Null
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
