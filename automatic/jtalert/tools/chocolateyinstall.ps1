$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/f3433bc7149504c748fd22307174cf3c'
  checksum     = '78e286b54853205c6df31ef2448e5273054929dac277e0135af23dddd59d5452'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
