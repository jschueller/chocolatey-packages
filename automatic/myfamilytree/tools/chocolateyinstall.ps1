$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.0.0.0.msi'
  checksum      = 'd7898c8b9cd63ed5348c13c62968ea2bc8f6f25fef9a0f3885cba4abf86f2baa'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.0.0.0x64.msi'
  checksum64    = '95c2a252edb5e36ea5f9b822b6ad75655ccf10b2f9e3ae7da1cd1408a087353f'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
