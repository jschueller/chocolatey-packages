$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/1007866289708d43bc85cffa9009f422'
  checksum     = 'ab267ab5538c929d1b94b16504a32975f08e2b2e2b6a130445db16824a80e5a7'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
