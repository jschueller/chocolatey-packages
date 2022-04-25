$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex_x86.msi'
  checksum      = '779A5F1B09B023CDBA0F958A1CDBE930F08932791B3CEC9AD8FCE68C3FD58793'
  checksumType  = 'sha256'

  url64         = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi'
  checksum64    = '877FEEAF1C0DCF7AB34CE090ED46EAF6EAE5C375F1442D8707CAEA5E60E77A56'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ALLUSERS=1 AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
