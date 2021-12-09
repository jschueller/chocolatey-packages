$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman640build2.exe'
  checksum      = 'c9971a1d6e83b6b03c6d6b6c23fd121683ad6498b5ae722f5c1fe80a3bc2d5ee'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
