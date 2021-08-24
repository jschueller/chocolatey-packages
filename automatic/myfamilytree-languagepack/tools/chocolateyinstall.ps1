$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.0.3000.0.msi'
  checksum      = '420971180aa46c51fbb126f6c800e80861af4334ba45074f117196092b992575'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.0.3000.0x64.msi'
  checksum64    = 'ff7bfd9c0a7a375d5bf6b383c4d985e630532a61174c10f5bd8d0f915084bac1'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
