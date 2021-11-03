$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls11;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://ftpmirror.gnu.org/octave/windows/octave-6.4.0-w32-installer.exe'
  checksum      = '3ec60731afb71355bac37e84b64afac0c4b8379b7a5548261e464ba3d1fb1ddf'
  checksumType  = 'sha256'

  url64         = 'https://ftpmirror.gnu.org/octave/windows/octave-6.4.0-w64-installer.exe'
  checksum64    = '954be76d860d76f7ac5780da518848ac6469e2873da9b091f2a467046336a154'
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
