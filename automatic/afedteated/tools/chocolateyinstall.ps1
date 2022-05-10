$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '9b00fc067e05c12223106fb3339f809f1ab233e5d5f08be1df7fbb632b85a30821b99c399007262289e948568f942b2f10e339fb470b7cc77801a4b9b0b7e7a0'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
