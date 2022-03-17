$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.easyuefi.com/downloads/EasyUEFI_Trial.exe'
  checksum      = 'CBBDEF0F86D67D36FDEA12EE53E3E236F81EE4485549945ED2DD39FB6258445A'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

# Note: Installation does not work with Windows 2012 R2
 If ( [environment]::OSVersion.Version.Major -lt 10 )  {
   Write-Warning 'Skipping installation because EasyUEFI supports only Windows 10, Windows 2016 and Windows 2019.'
   return
 }

Install-ChocolateyPackage @packageArgs