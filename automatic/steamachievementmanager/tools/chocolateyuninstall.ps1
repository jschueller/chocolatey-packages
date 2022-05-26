$ErrorActionPreference = 'Stop'
Uninstall-ChocolateyZipPackage $env:ChocolateyPackageName 'SteamAchievementManager-7.0.25.zip'

# Remove start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "SAM.Game.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

$shortcutFilePath = Join-Path $programs "SAM.Picker.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }
