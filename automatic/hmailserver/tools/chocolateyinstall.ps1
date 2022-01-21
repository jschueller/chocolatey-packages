$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.hmailserver.com/files/hMailServer-5.6.8-B2574.exe'
  checksum     = 'b7239676cd5eb9f21bf49c9ae170e7004b8abecb7eea08108930866a37d72659'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
