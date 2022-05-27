$ErrorActionPreference = 'Stop'
Uninstall-ChocolateyZipPackage $env:ChocolateyPackageName 'steascree-1.5.4-windows-portable.zip'# Remove start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "SteaScree.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }
