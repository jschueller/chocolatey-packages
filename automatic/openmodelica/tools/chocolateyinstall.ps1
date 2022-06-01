$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.19/0/32bit/OpenModelica-v1.19.0-32bit.exe'
  checksum      = '8482341a616ad8c0c0309ba40c6c4844b92599b58bbd786bbc20bba194cd4fa2'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.19/0/64bit/OpenModelica-v1.19.0-64bit.exe'
  checksum64    = 'c3e0378ba2d8490a16f8a446cbc22304ac95dffe23e064edf3ad86b9d43b8ee5'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
