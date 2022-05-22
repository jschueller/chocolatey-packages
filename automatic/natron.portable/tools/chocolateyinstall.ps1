$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url64          = 'https://github.com//NatronGitHub/Natron/releases/download/v2.4.3/Natron-2.4.3-Windows-x86_64.zip'
  checksum64     = '5bd66ac2da636f89f1d9e7622f6e25010d67853aa8244ea7e3e1d9bbbd790c40'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for any executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude "natron.exe"
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$OSArchitectureWidth = Get-OSArchitectureWidth
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Natron.lnk"
$targetPath = (Get-ChildItem -Recurse "$toolsDir\Natron-*-Windows-x86_${OSArchitectureWidth}bit-no-installer\bin\natron.exe").fullName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
