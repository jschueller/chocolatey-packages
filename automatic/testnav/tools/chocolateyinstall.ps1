$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://download.testnav.com/_testnavinstallers/testnav-1.10.2.msi'
  checksum      = '03aa6911a31e79496cb478a73aeefc241e17a5c9b8ef71bfda2c2a4b40d69be4'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs