$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.0.0000.0.msi'
  checksum      = 'd25114738118cc5f8a5ce3b042da3bf566b7e608a542803a0d4884a6c4fa0127'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.0.0000.0x64.msi'
  checksum64    = 'f420701648e3654e68f8e9ede100203c26568a38faef58309b1ef79a4e75c444'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
