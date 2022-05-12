$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_portable.zip'
  checksum       = 'a9d60d83eb0205b04af4e3f850677772d4ea399830ef123ddb3d89be4b9e8d7c'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64_portable.zip'
  checksum64     = '1775ab6f6d80b7a3e4002a459de3626edc2c1d3fc600574f9158e8c3b9a5256f'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Ocenaudio.lnk"
$targetPath = Join-Path $toolsDir "ocenaudio.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
