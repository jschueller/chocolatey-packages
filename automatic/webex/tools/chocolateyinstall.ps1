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
  checksum      = 'DAE3CE451B7195972830BEB0D24A31B8F64FEF548A7CC8988E4C427F52C7F5FD'
  checksumType  = 'sha256'

  url64         = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi'
  checksum64    = 'D58B1C2D5656EAB34A81E7639D3D0E17E7CBFA7CDD25E42A4671BA13F1923959'
  checksumType64= 'sha256'

  silentArgs    = "$sa /qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
