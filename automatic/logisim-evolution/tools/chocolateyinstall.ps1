$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  FileFullPath  = "$toolsDir\logisim-evolution.jar"

  url           = 'https://github.com/logisim-evolution/logisim-evolution/releases/download/v3.6.0/logisim-evolution-3.6.0-all.jar'
  checksum      = '66a8a20a6f57491f2c67f82ba47b03e1b23b7f5188f83952032c0420f32b58fb'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Logisim Evolution.lnk"
$targetPath = Join-Path $toolsDir "logisim-evolution.jar"
$iconLocation = "$toolsDir\logisim-evolution.ico"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath -iconLocation $iconLocation

Write-Warning "You can launch `"Logisim Evolution`" from the start menu."
Write-Warning "Note: Java needs to be installed before using Logisim Evolution."
