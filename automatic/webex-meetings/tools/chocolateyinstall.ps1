$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '4b4880d5beff5f8d098a4aa7347c85e7f36a9a1ea91d92aacfd2cc7ee56bfb7fa4fe198b704732d671c2b444111d3ba4f3e039f24952e318c6a77cce1aae6feb'  
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
