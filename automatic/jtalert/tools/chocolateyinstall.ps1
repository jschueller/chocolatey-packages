$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/a1c7aa274838bf89085ac36f9d6ab33d'
  checksum     = '18719b7ff543819ea1cc97467e87fa578da66042e14a338415914829d7eb90e9'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
