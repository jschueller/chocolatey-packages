$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex_x86.msi'
  checksum      = '06A7CC71F9C9E12784CE3C84475A91D6BE6319B7D4840B0CED4DF6F601B1A165'
  checksumType  = 'sha256'

  url64         = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi'
  checksum64    = 'F09771F0D92CAF2057BA513B147833A514451A50F467837FAFD2CCFAF756098F'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
