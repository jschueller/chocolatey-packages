$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = "$toolsDir\vhui$(Get-OSArchitectureWidth).exe"

  url            = 'https://www.virtualhere.com/sites/default/files/usbclient/vhui32.exe'
  checksum       = '497f17a42c260400e59e14a37eadec17c4afc3b52ebd54c7c3f15c1e8cdab35c'
  checksumType   = 'sha256'

  url64          = 'https://www.virtualhere.com/sites/default/files/usbclient/vhui64.exe'
  checksum64     = 'ca0fc640f6e4d947135ef77ec680ebdd5b83f8b2fc234e2c6531fb400467dec5'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Virtual Here USB Client.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $packageArgs.fileFullPath
