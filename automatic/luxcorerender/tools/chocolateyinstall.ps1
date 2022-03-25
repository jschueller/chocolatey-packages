$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  url64         = 'https://github.com/LuxCoreRender/LuxCore/releases/download/luxcorerender_v2.6/luxcorerender-v2.6-win64.zip'
  checksum64    = '9e7f2d0a7e2cc46ff02fe8cb8d88fa82d17b6eabfc1ce87cfe22e0b8961fc902'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Lux Core Render.lnk"
$targetPath = Join-Path $toolsDir "luxcorerender-v2.6-win64\luxcoreui.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
