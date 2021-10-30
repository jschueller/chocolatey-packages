$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman639build8.exe'
  checksum      = '6f508a58d0adf2b175864bba1e65a845df425f5e5926d9e3b0f5b42db424290f'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
