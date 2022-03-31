$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = 'd8df9eeaf6ae9ecbafd58571a354d375e75e5cc43ec3993d8c6efe856af45763'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = '5c7a24839bb56f86a387e5065dd95fde26d95ffcc000c6eccd46a06238d37650'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
