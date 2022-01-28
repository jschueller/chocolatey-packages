$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'http://archive.palemoon.org/basilisk/basilisk-20201125140449.win32.installer.exe'
  checksum       = '05240bb65daf43fdda01cc45b483a4a9326cd3f8e4f2123e8ec7d0b7ec958341'
  checksumType   = 'sha256'

  url64          = 'http://archive.palemoon.org/basilisk/basilisk-20220127135138.win64.installer.exe'
  checksum64     = '3324e597f3a8a4686f4dd4db8f76a8c91cbc1230c536f85d8122c5b2be903701'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
