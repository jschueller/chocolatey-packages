$ErrorActionPreference = 'Stop';
# Install botpress to its own directory, not in the chocolatey lib folder
# If requesting per user install use $env:APPDATA else $env:ProgramData
$botpressDir = Join-Path $env:ProgramData $env:ChocolateyPackageName

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $botpressDir
  
  url           = 'https://s3.amazonaws.com/botpress-binaries/botpress-v12_26_5-win-x64.zip'  
  checksum      = 'bdcf94ca6320f5c8298ac5640e7515e2267be3b92a2e8c8b78a9e93beebbcf79'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Botpress.lnk"
$targetPath = Join-Path $botpressDir "bp.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
