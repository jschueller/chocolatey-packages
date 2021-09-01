$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://static.files.bbci.co.uk/iplayer-pc-download-app/releases/win32-x64/BBCiPlayerDownloadsSetup-2.13.4.exe'
  checksum      = '7733afc644cd559ab18cbc3c6c03b71e8a4110b49ce9b5b1e0b99b4fd61de860'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  file          = "$toolsDir\bbciplayerdownloads-2.13.4-full.nupkg" 
}

Install-ChocolateyZipPackage @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "BBCiPlayerDownloads.lnk"
$targetPath = Join-Path $toolsDir "lib\net45\BBCiPlayerDownloads.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
