$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/0aeffb87d29c6309d2602ea6bd7b3887'
  checksum     = '7c70f0cb1671eb7e9adf87b181c4094a777d4232464624e615594f73798b3409'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
