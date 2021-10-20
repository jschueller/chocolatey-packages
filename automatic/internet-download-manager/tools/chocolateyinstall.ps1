$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman639build5.exe'
  checksum      = 'ee59a9b7707b2890f5b13f0d75bf99dd7d84d426dc13772764353c57f2e47c01'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
