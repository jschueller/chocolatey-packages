$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$env:ProgramFiles\AGW_Chateaux"

  url           = 'http://f1agw.free.fr/AGW_Chateaux/AGW_Chateaux_180_SI.zip'
  checksum      = '1c31996236af9e65e6d4861b2b9868cfcdbf8ecf696ae3b11bf3174b0eb686bd'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "AGW Châteaux.lnk"
$targetPath = Join-Path "$env:ProgramFiles\AGW_Chateaux" "AGW_Chateaux.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
