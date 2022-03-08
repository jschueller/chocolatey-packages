$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/marktext/marktext/releases/download/v0.17.1/marktext-setup.exe'
  checksum     = 'b9bf5a5d9307e190cdd12c05e6056ddbed54dce3a1b4fdb28e7d61683ac799aa'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
