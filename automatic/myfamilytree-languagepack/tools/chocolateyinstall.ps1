$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.1.1000.0.msi'
  checksum      = '883998eeb3e459115c4a870c298ba472e305c0fd130ab7cc64c45e000f9aa925'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.1.1000.0x64.msi'
  checksum64    = '7b2cf5e39abab34b7f6c89843a1c99709df5fd20e3793b52a8c7a7a75f7021d8'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
