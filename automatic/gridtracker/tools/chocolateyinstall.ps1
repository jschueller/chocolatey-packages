$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://storage.googleapis.com/gt_download/v1.21.0503-2/GridTracker-Installer.1.22.0503.exe'
  checksum     = 'e641fd83bf281e11364eb138e906b6e85093c7504cf06bbb08605503d1d0e152'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
