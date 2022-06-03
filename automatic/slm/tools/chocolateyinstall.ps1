$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'https://download.softros.com/SoftrosLANMessengerSetup.msi'
  checksum     = 'ea7e532ba88e306192642d05beaf108bd04fb32d8a2fed5a7495fa1938cac931'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
