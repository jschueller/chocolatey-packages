$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\steascree-1.5.4-windows.exe"
  silentArgs  = '--mode unattended'
}

Install-ChocolateyInstallPackage @packageArgs
