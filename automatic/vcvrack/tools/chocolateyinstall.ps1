$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file64      = "$toolsDir\RackFree-2.0.6-win.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
