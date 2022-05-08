$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url64         = 'https://files.salome-platform.org/Salome/Salome9.8.0/SALOME-9.8.0.zip'
  checksum64    = '1189685373bbed37cd3e6317ff44beb39d5a42dfb5f3def19adf1b26a706a324'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

<#$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"  
  file64      =  (Get-ChildItem "$toolsDir\SALOME-*.tar").FullName
}
Get-ChocolateyUnzip @packageArgs
Remove-Item $packageArgs.file64#>

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'SALOME.lnk'
$targetPath = (Get-ChildItem "$toolsDir\SALOME-*\run_salome.bat").FullName
#$targetPath       = Join-Path $toolsDir 'SALOME-9.4.0\run_salome.bat'
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutFilePath" -TargetPath "$targetPath"
