$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/352cf9ff1d9007467915d0d8ecce298c'
  checksum     = 'adecf50beeb2858c2de9de40fc1ad222dc07c85900966f65640ef458c44e514d'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
