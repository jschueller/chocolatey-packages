$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir" 

  url           = 'https://www.ne.jp/asahi/foresth/home/spdf348.zip'
  checksum      = '93dbf1dc71261b991aaa4bfc9895cb13bb55016bf8568fd165232c402e33181c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "SepPDF.lnk"
$targetPath = Join-Path $toolsDir "SepPDF.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
