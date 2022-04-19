$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.1.0000.0.msi'
  checksum      = '5488e162d513afcf68f209a5b1c002e8dfabdd96f80d949019a4ae962239eee9'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.1.0000.0x64.msi'
  checksum64    = '16a50206c11bb1d9cc9b5695e81f3ae17efe0c41b7f406eba0cd68c3953b07c0'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
