$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/2dc5d875bb4da19b1fcdad70bc254de4'
  checksum     = 'e2a2a3300653d275cc5e0d4751d56b396ca5ef64a3d9399aef22b5fac0e87d8c'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
