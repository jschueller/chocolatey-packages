$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.1.2000.0.msi'
  checksum      = '79358ad3160f97e2b30e8eb6c7926102f43e260b8b6ac376b2a4cfad94b9ca6c'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.1.2000.0x64.msi'
  checksum64    = '4cba4a4b7a6eb614e56ab3103fa0c7a08ad7331757890b726f89a84d339bb1ca'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
