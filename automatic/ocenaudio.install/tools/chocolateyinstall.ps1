$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = 'fd3562525542b9268b6b6b2bb7bcd4e81e3bf0cfadf1114fbaae47b3b32bf074'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = '6a9b77dcf10fb8d18801cc5d900cfef703925f23ccf01dedd6d2e3ca0c9f2a77'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
