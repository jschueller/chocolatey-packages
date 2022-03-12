$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url32        = 'https://github.com/marktext/marktext/releases/download/v0.17.1/marktext-ia32-win.zip'
  checksum32   = ''
  url64        = 'https://github.com/marktext/marktext/releases/download/v0.17.1/marktext-x64-win.zip' 
  checksum64   = ''

  checksumType = 'sha256'  
}
Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path "$programs" 'Mark Text.lnk'
$targetPath = Join-Path "$toolsDir" 'Mark Text.exe'
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutFilePath" -TargetPath "$targetPath"
