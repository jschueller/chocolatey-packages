$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.kafkatool.com/download2/offsetexplorer.exe'
  checksum      = 'b32ee487c534ba3188bc78f37ea9a0428f5fde399d5acc6b6682372a97231c1a'
  checksumType  = 'sha256'

  url64bit      = 'https://www.kafkatool.com/download2/offsetexplorer_64bit.exe'
  checksum64    = 'f51e3445032ecf2aa7703cd115b456dd36d330bc10593c9b208beda8ea3a1f84'
  checksumType64= 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
