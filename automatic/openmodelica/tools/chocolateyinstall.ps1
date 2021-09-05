$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.18/0/32bit/OpenModelica-v1.18.0-32bit.exe'
  checksum      = '3c945bb75577066207be6e53aa44e82615d20849c8f04608c900efcb9fc1eb47'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.18/0/64bit/OpenModelica-v1.18.0-64bit.exe'
  checksum64    = 'f1e4c6252857ddceff613ccab3e0ed38ff7056e24ce809915707a318e692d54b'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
