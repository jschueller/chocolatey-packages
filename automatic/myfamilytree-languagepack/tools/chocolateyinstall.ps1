$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.1.0000.0.msi'
  checksum      = '00952c9a75cba28b4fc6d1c2481d59b24c5705d833b502655a88808665a52226'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.1.0000.0x64.msi'
  checksum64    = '4a23edb45f5959ecbcdaa5e74be3e72a3f6ef4c7757a9c980ee75bc272ad6fc9'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
