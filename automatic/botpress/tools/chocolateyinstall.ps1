$ErrorActionPreference = 'Stop';
# Install botpress to its own directory, not in the chocolatey lib folder
# If requesting per user install use $env:APPDATA else $env:ProgramData
$botpressDir = Join-Path $env:ProgramData $env:ChocolateyPackageName

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $botpressDir
  
  url           = 'https://s3.amazonaws.com/botpress-binaries/botpress-v12_24_0-win-x64.zip'  
  checksum      = '4b8981f5b3da1540544a68f3ee0ec2651499e75bd5a4c3d11546614c11f5aa26'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Botpress.lnk"
$targetPath = Join-Path $botpressDir "bp.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
