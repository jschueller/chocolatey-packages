$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.0.2000.0.msi'
  checksum      = '9fcfa91ab8ef67eccf8641485ea2c34834a163a9a858b84d186fa66c831f8f20'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.0.2000.0x64.msi'
  checksum64    = 'b0e97aa396baeee411b0c49c18c4e7ee32c3a2686ba8db781d228a6ec8f98d4d'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
