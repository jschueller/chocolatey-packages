$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/marktext/marktext/releases/download/v0.17.0/marktext-setup.exe'
  checksum     = '18819048c06775a8b8217edddb81a3619570869de3e41ec94626c9bb18e0881c'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
