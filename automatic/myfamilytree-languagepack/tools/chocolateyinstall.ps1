$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.1.3000.0.msi'
  checksum      = '976acb1a54cf02006f65ec187b3a7652aa9a0d0e15795a7d2ac1eb329911c90c'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.1.3000.0x64.msi'
  checksum64    = 'df07c660b98a653727f2067b3dc625f4a682ca4fcaf18ecfef2dd831dde344ce'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
