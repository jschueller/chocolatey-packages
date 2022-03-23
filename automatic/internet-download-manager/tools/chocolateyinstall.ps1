$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman640build10.exe'
  checksum      = '5daf73754d1f51129c9715c28e5fb9abc680746c1cc1bdc2a249a01fddfe3483'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
