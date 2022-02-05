$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  #file          = "$toolsDir\Locale.Emulator.2.5.0.1\LEInstaller.exe"
  file          = "$toolsDir\LEInstaller.exe"

  url           = 'https://github.com/xupefei/Locale-Emulator/releases/download/v2.5.0.1/Locale.Emulator.2.5.0.1.zip'
  checksum      = '808ff584426d52cc775ad6406da00622f454be95bd4c8fbca42eef4b7235ad5c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Locale Emulator GUI.lnk"
$targetPath = Join-Path $toolsDir "Locale.Emulator.2.5.0.1\LEGUI.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

Write-Warning 'Launch LEGUI or "Locale Emulator GUI" from start menu to access settings.'
