$ErrorActionPreference = 'Stop';
# Install botpress to its own directory, not in the chocolatey lib folder
# If requesting per user install use $env:APPDATA else $env:ProgramData
$botpressDir = Join-Path $env:ProgramData $env:ChocolateyPackageName

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $botpressDir
  
  url           = 'https://s3.amazonaws.com/botpress-binaries/botpress-v12_26_2-win-x64.zip'  
  checksum      = 'deb73ecb9245edb883b8d2a7cfcfa3a84694aadefda817c17786f6a589cbd211'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Botpress.lnk"
$targetPath = Join-Path $botpressDir "bp.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
