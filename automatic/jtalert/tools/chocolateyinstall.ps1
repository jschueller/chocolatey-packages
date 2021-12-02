$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/b9f595e8b0a2fdc4aa1af1bba5b4b0f6'
  checksum     = '898fe149bd34c7688ed67972dffc00d68cd1f27fd2d90a43c066ee2c6d0e2a8e'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
