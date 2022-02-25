$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"  

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.19.0/TIB_js-studiocomm_6.19.0_windows_x86_64.zip'
  checksum64     = '9a9589d67c0c5cd6c193207566e5f9a853cbaab57e8a3af23bb3adea5f33db05'
  checksumType64 = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude 'JasperSoft Studio.exe'
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'JasperSoft Studio.lnk'
$targetPath = Join-Path $toolsDir 'jaspersoftstudio\JasperSoft Studio.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
