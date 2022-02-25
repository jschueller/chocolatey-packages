$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'
  file          = "$toolsDir\EVGA_Flow_Control_Setup.exe"

  url           = 'https://cdn.evga.com/utilities/EVGA_Flow_Control_Setup_v2.1.0.zip'
  options       = @{ Headers = @{ "Accept-Encoding"="gzip, deflate, br"; } }
  checksum      = '6b033eeea1a7076058b1b7ee332b06c309ec611329e15fb2d4fe6cd3faa11c83'
  checksumType  = 'sha256'

  silentArgs    = '/S /v/qn'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
