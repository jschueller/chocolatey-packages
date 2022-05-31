$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman641build2.exe'
  checksum      = '025eac1fad5cdb0442bff25b2bcc80e28f28ac97910dd88f5b750fc06dc4b29e'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
