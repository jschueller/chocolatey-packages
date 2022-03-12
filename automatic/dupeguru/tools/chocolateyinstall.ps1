$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://github.com/arsenetar/dupeguru/releases/download/4.2.0/dupeGuru_win64_4.2.0.exe'
  checksum     = 'a079df1377d877196df1d2bbb08ad022ff7c511347d965bcaa160a7455c5cd3e'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
