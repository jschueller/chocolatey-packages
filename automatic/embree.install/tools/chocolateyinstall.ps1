$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  filetype    = 'ZIP'
  destination = "$toolsDir"
  file64      = "$toolsDir\embree-3.13.3.x64.vc14.windows.zip"  
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file64