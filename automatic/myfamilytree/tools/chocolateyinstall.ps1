$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree11.1.6.0.msi'
  checksum      = '99825b9bc86572bb79a04b305d1cec0ec9c1283b6110859b74c49e80f0cfd87a'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree11.1.6.0x64.msi'
  checksum64    = 'ab6e8598ce9c9ecf6f7350ad2715b6fe0dbc94c5e60ecaa760ede0d1452317e9'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
