$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree11.1.2.0.msi'
  checksum      = 'a9d0e7821dd5c20a2be6ad647d0818d43146a2468b6b2d3447205f81df1acf53'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree11.1.2.0x64.msi'
  checksum64    = '6df6f5ff1fb6302b3e6cb89911eaa4d99f8a3f392566c84b00720fedc072ba7f'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
