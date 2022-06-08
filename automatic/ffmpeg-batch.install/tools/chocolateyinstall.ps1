$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\FFBatch_AV_Converter_2.7.7_32bit.exe"
  file64      = "$toolsDir\FFBatch_AV_Converter_2.7.7_64bit.exe"
  silentArgs  = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs
Stop-Process -Name FFBatch
Remove-Item -Path "$toolsDir\*.exe" -ErrorAction SilentlyContinue
