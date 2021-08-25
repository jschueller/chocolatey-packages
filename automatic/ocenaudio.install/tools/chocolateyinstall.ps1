$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = 'c94e988b2183a4996bdbd3b54e4cd2b79cd5b0ed6b1674138172b61201be8be6'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = 'a3c222d50f570d2669b51489ced30088f60695ecddd9a65d4cd551fe0a03f9c5'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
