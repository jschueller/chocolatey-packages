$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://infinitekind.com/stabledl/current/Moneydance_windows_amd64.exe'
  checksum64     = 'd1f6e90d862ae67b312ba302c127f36b7ac64d217900d3a195f99f7453215169'
  checksumType64 = 'sha256'

  silentArgs     = "-q"
}

Install-ChocolateyPackage @packageArgs
