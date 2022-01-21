$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.poly.com/content/dam/www/software/PlantronicsHubInstaller.exe'
  checksum     = 'fe693ddd25f995db6e7c6b6cbf956317452c58aa23b562342222f000e0dc4a56'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
