$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


# Remove previous setup
Remove-Item -Path "$toolsDir\*.zip" -ErrorAction SilentlyContinue

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  destination    = "$toolsDir"

  url64          = 'https://github.com//NatronGitHub/Natron/releases/download/v2.4.3/Natron-2.4.3-Windows-x86_64.zip'
  checksum64     = '5bd66ac2da636f89f1d9e7622f6e25010d67853aa8244ea7e3e1d9bbbd790c40'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = (Get-ChildItem -Recurse "$toolsDir\Natron-*-Windows-*64\Setup.exe").fullName
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs
