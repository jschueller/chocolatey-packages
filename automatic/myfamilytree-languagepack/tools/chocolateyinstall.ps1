$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.1.4000.0.msi'
  checksum      = 'c10cfc8800e8fd60ab82dc7cfeb6055f19cc6d0562b8149987537025924826c7'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.1.4000.0x64.msi'
  checksum64    = '670ad6df888d14cdf4396a37de7bc7d684e44391d2b46ab50780fdb625ff6cd4'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
