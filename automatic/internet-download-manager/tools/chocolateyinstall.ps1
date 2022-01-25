$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman640build7.exe'
  checksum      = 'b55ddc25f3bbed1c9cfa5a5b749ac1de1b0678974996cf490b129ae97c9d091f'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
