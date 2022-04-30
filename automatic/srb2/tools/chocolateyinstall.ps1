$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/STJr/SRB2/releases/download/SRB2_release_2.2.10/SRB2-v2210-Installer.exe'
  checksum      = '5200493f0e2df01d106c170a6dfca2b1b0ac9dbdd2461689cb8dd3085aa40cd7'
  checksumType  = 'sha256'
  
  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
