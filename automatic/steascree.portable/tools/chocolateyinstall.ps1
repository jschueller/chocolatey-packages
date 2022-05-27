$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\steascree-1.5.4-windows-portable.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Exclude 'SteaScree.exe'
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "SteaScree.lnk"
$targetPath = $(Get-ChildItem -Recurse "$toolsDir" -Include 'SteaScree.exe').fullName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath