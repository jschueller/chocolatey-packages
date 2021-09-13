$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/20ea819decc346e8c563c2760ba5431d'
  checksum     = '8e41d0aad87a71615fd33853cb6ab72f4f2a034a827bf90367846b8ac946f2b8'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
