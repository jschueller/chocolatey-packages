$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


# Remove previous setup
Remove-Item -Path "$toolsDir\*.zip" -ErrorAction SilentlyContinue

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  destination    = "$toolsDir"

  url64          = 'https://github.com/NatronGitHub/Natron/releases/download/v2.4.0/Natron-2.4.0-Windows-64.zip'
  checksum64     = '0f7e6755702d11a25fe8aa946202cd2aae1fe571b2fea19d853fb448971b84a9'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = (Get-ChildItem -Recurse "$toolsDir\Natron-*-Windows-64\Setup.exe").fullName
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs