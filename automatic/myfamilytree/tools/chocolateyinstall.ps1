$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree11.1.4.0.msi'
  checksum      = 'f099e08a58b666207d88043d0f1c4c7c93c2feba639b5f6d61b10c788010d026'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree11.1.4.0x64.msi'
  checksum64    = '6dcbd7d6ec13739d1a39dc34bfdc26118e8fc696bdd16dc6968006d6e6b3d49c'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
