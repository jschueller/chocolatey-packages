$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$toolsDir\MoonlightSetup-3.2.0.exe"  
  silentArgs	= '/S'
}

Install-ChocolateyInstallPackage @packageArgs
