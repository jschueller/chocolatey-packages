﻿$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  file         = "$toolsDir\wsjtx-2.5.1-win32.exe"  
  silentArgs   = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
