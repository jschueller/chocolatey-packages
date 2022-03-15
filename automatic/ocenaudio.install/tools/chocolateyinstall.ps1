$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = 'e28951c33d7d154c69c84e62e1917695ebafc4f387b605fa35b1e599808c1cb7'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = '50d2dd5cf6c3f2985b5bf54a0906c3200e2fcb4832cb73781c506fb6299bcd4c'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
