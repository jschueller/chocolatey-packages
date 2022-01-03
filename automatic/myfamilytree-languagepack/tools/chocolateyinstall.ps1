$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.1.6000.0.msi'
  checksum      = 'bd81f1177f6fc0a6d9c75a7ba3341b8721d027b2ac869f2d3cc4d99ddeab008e'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.1.6000.0x64.msi'
  checksum64    = '61ed3fe9b4c6892c34dfe73a71635573cf6f51b979d01fba5702dc8aa7e8c2f8'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
