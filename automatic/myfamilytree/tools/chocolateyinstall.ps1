$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.1.1.0.msi'
  checksum      = 'b1f033e7d9688e756f72ef6293805b44e64e25c7ccbb2cea59731b5ef7132b6f'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.1.1.0x64.msi'
  checksum64    = 'ae7ef5a809a98231de8eb6a0f896d9d7916d2903857a25e880fa399a555b8c06'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
