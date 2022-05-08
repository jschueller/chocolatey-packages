$ErrorActionPreference = 'Stop';
$pp = Get-PackageParameters

$sa = ""
$sa += if ($pp.ACCEPT_EULA) { ' ACCEPT_EULA=TRUE' }
$sa += if ($pp.AUTOSTART_WITH_WINDOWS) { ' AUTOSTART_WITH_WINDOWS=' + $pp.AUTOSTART_WITH_WINDOWS }
$sa += if ($pp.DEFAULT_THEME) { ' DEFAULT_THEME="' + $pp.DEFAULT_THEME + '"' }
$sa += if ($pp.DELETEUSERDATA) { ' DELETEUSERDATA=1' }
$sa += if ($pp.EMAIL) { ' EMAIL=' + $pp.EMAIL }
$sa += if ($pp.ENABLEOUTLOOKINTEGRATION) { ' ENABLEOUTLOOKINTEGRATION=1' }
$sa += if ($pp.INSTALL_ROOT) { ' INSTALL_ROOT="' + $pp.INSTALL_ROOT + '"' }
$sa += if ($pp.ALLUSERS) { ' ALLUSERS=1' }

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex_x86.msi'
  checksum      = '2EC405FEE48C3068963D79ED2849910F6CC9AFE1C8DE92B335FF297487FB7C51'
  checksumType  = 'sha256'

  url64         = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi'
  checksum64    = 'BCB360BA4DA1A600E3DD2B00ED77CF5355AB1B8717F8124BFE86E9FCA8F3401A'
  checksumType64= 'sha256'

  silentArgs    = "$sa /qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
