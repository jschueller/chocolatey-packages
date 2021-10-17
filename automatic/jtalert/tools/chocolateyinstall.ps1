$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/def1e8965747a8b5a5e4a6fffb5a3103'
  checksum     = '51c59daa7eac69c2d53b072a4e890122945dc27a9a92e2a43781190b35e252a9'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
