$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"  

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.18.1/TIB_js-studiocomm_6.18.1_windows_x86_64.zip'
  checksum64     = 'ce0a00a4c8e608650d42e74bf62a8afcada037139f9aaf085eeb5ab7c340e2e2'
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
