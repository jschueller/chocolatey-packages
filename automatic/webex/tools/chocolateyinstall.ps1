$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex_x86.msi'
  checksum      = 'E548AB00FF2B07C83A0381E3B190490550C053A31200AABA120B282D04A98D29'
  checksumType  = 'sha256'

  url64         = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi'
  checksum64    = 'D2D824C8FEB8D089CC1D65EAB1AD34DF94F46EF5C3B3F2C2DB458598D2239579'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ALLUSERS=1 AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
