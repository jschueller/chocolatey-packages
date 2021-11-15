$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.1.2000.0.msi'
  checksum      = 'f119eedcf9ff3565a32c6537e2377723606323f500a88a84ce9fc80c5b4047bf'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.1.2000.0x64.msi'
  checksum64    = '77dab6f2d9ade53ddf664dc74c8d85557eec9c45c7eeb4776324bdf5f561d5e0'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
