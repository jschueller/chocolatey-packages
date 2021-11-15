$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'http://archive.palemoon.org/basilisk/basilisk-20201125140449.win32.installer.exe'
  checksum       = '05240bb65daf43fdda01cc45b483a4a9326cd3f8e4f2123e8ec7d0b7ec958341'
  checksumType   = 'sha256'

  url64          = 'http://archive.palemoon.org/basilisk/basilisk-20211114000702.win64.installer.exe'
  checksum64     = 'a55512e944ddd0692b04f3935f8c387e764f9b2a2cfb80b9e53a9a248ff41dde'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
