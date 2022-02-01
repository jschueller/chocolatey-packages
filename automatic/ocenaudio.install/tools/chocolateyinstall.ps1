$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = '01add2d589d6585aa5bb643004939c28a48683eaf63a6ae93d56edf7264ac4d1'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = '55f30b3a64d68e1f65f4fff1aebeb88c1c3e284c98ec4e52dfaaa0e079da2d0e'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
