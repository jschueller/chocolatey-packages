$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\tesseract-ocr-w32-setup-v5.0.0-rc1.20211030.exe"
  file64      = "$toolsDir\tesseract-ocr-w64-setup-v5.0.0-rc1.20211030.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
Install-ChocolateyPath $env:ProgramFiles\Tesseract-OCR
