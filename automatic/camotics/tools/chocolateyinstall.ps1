$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\camotics_1.2.0_x86.exe"
  file64      = "$toolsDir\camotics_1.2.0_AMD64.exe"
  silentArgs  = "/S _?=$Env:PROGRAMFILES\$packageName"
}

Install-ChocolateyInstallPackage @packageArgs