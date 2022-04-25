$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.1.1000.0.msi'
  checksum      = '40a45e6e78d12cd8367f85a097f88192df0fddbc239f4799e9546307dbff4212'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.1.1000.0x64.msi'
  checksum64    = '581261e3f5e4df58991b8a288dc1317df5af0c2ce3a872e7aed9693d2fddc96d'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
