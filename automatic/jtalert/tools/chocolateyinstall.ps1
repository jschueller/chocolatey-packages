$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/1673ebb4e5c65766aee8d5344f6cddb2'
  checksum     = '19d41069dfb2b2320b6889d8f68ad4a8a12cd4aa5f4d25567d0968bbb9fcdbf2'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
