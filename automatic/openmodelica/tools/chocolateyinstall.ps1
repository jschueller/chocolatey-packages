$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.19/0/32bit/OpenModelica-v1.19.0-32bit.exe'
  checksum      = '8482341a616ad8c0c0309ba40c6c4844b92599b58bbd786bbc20bba194cd4fa2'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.19/0/64bit/OpenModelica-v1.19.0-64bit.exe'
  checksum64    = 'f82cb910bf1f33536493efd0e1676e86b9cc10897861aaf50fe03aa0437beedc'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
