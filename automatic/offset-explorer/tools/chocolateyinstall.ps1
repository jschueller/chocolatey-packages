$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.kafkatool.com/download2/offsetexplorer.exe'
  checksum      = '93813c6625a3549743527c0b9fd1e5037fa9a768a5ac05084fd14b86d7fe044c'
  checksumType  = 'sha256'

  url64bit      = 'https://www.kafkatool.com/download2/offsetexplorer_64bit.exe'
  checksum64    = '52b85e7456b1e9f286a7d332d3a1192363baf1ad9b27ecda9efb0f91915cee77'
  checksumType64= 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
