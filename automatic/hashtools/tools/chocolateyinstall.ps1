$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://binaryfortressdownloads.com/Download/BFSFiles/109/HashToolsSetup-4.4.exe'
  checksum     = '417706f2232f33238c471049cb66081df65c6c8f7a478720977c5cc1c5addd2c'
  checksumType = 'sha256'
  
  silentArgs   = '/VERYSILENT /SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
