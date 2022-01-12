$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filefullpath = "$toolsDir\SunsetScreen.exe"

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen.exe'
  checksum     = 'c514aa1c41699410643c6f9789ca4cf6f3e5c7079a43d36f1fa74e6d8ef9aafe'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "SunsetScreen.lnk"
$targetPath = Join-Path $toolsDir "SunsetScreen.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
