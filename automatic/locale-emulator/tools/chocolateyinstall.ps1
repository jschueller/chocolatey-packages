$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  file          = "$toolsDir\Locale.Emulator.2.5.0.0\LEInstaller.exe"

  url           = 'https://github.com/xupefei/Locale-Emulator/releases/download/v2.5.0.0/Locale.Emulator.2.5.0.0.zip'
  checksum      = '5b5dfd183cecd40efba9f549f53cdae6d659c3dd85b9caad926aaebe5db4acb0'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Locale Emulator GUI.lnk"
$targetPath = Join-Path $toolsDir "Locale.Emulator.2.5.0.0\LEGUI.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

Write-Warning 'Launch LEGUI or "Locale Emulator GUI" from start menu to access settings.'
