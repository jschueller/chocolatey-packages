$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://github.com/arsenetar/dupeguru/releases/download/4.3.0/dupeGuru_win64_4.3.0.exe'
  checksum     = '7dc873a4863feab736b5bb87f49c165afebf18ea9ed875fa5c62aadc1014826d'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
