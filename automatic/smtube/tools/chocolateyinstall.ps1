$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\smtube-21.7.0-win32.exe"
  file64      = "$toolsDir\smtube-21.7.0-x64.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
