$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://spacedesk.net/downloads/spacedeskWindowsVIEWER_v0939_BETA.msi'
  checksum      = '88dd862b8aa3e84985739322de994e9b4f6afd51c11a07bce5a19f3806c7c008'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
