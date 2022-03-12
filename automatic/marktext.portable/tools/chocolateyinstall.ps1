$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url32        = 'https://github.com/marktext/marktext/releases/download/v0.17.1/marktext-ia32-win.zip'
  checksum32   = 'cb04c3dc7404223fd241c5479a65ff77c3923896e17a4848ad11a767164b90c7'
  url64        = 'https://github.com/marktext/marktext/releases/download/v0.17.1/marktext-x64-win.zip' 
  checksum64   = '2e5ffe0e6e77b8400f60dc0b38bf2615e558b2defaeda5f3ba4b2dc57ee2af15'

  checksumType = 'sha256'  
}
Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path "$programs" 'Mark Text.lnk'
$targetPath = Join-Path "$toolsDir" 'Mark Text.exe'
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutFilePath" -TargetPath "$targetPath"
