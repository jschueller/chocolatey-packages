$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman639build3.exe'
  checksum      = 'fdd03ebb8f78b45e6a0b7d1b3478e71c525729b7769e7b720630d763273eea16'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
