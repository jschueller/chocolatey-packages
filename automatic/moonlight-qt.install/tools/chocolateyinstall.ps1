﻿$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$toolsDir\MoonlightSetup-3.1.2.exe"  
  silentArgs	= '/S'
}

Install-ChocolateyInstallPackage @packageArgs
