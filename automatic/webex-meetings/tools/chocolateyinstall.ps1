$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = 'e9aed46fe130c7da2ac82fe368c438771b5b09c77a44d7dd54732fa174e02e99c5e13e5ccddae83a88730e68ca1987fafb9b3a561e1627f4c72a961a18d361c4'  
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
