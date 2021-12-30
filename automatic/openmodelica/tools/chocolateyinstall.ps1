$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.18/1/32bit/OpenModelica-v1.18.1-32bit.exe'
  checksum      = '8d4329a9c7998dd29982231fa96b984a04d02e4d83b06addbe9d0de2cd91bf07'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.18/1/64bit/OpenModelica-v1.18.1-64bit.exe'
  checksum64    = 'bc4f81ca3ff2c45569c4f5f24757b0ae84cb1b8ab321b2a08d76e3ead859d34c'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
