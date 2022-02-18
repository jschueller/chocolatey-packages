$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  checksum64  = ''
  url64       = 'https://github.com/LuxCoreRender/LuxCore/releases/download/luxcorerender_v2.6/luxcorerender-v2.6-win64.zip'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Lux Core Render.lnk"
$targetPath = Join-Path $toolsDir "luxcorerender-v2.6-win64\luxcoreui.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
