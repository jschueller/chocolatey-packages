$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree11.1.1.0.msi'
  checksum      = '3e68cc0321cb11f7f347d9ce08d9e043128329cffa0fce826a9b2a04e2f4ab32'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree11.1.1.0x64.msi'
  checksum64    = '112d1184b211f620abeb2e7a3f53ec0a44bb469328e7a87b26bad0912f06e401'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
