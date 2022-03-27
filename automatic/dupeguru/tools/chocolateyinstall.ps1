$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://github.com/arsenetar/dupeguru/releases/download/4.2.1/dupeGuru_win64_4.2.1.exe'
  checksum     = '15159d32a3da81faec92753f6fd9d5c29db0b7d825f4701d77915f1b91072637'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
