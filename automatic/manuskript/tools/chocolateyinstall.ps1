$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com/olivierkes/manuskript/releases/download/0.13.1/manuskript-0.13.1-win32.zip'
  checksum      = '076e0e149f62e58e318aae1e00e6dfff3b458b1c7102b128405be3e92d8cea23'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Manuskript.lnk"
$targetPath = Join-Path $toolsDir "manuskript\manuskript.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
