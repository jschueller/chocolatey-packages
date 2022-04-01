$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/f8d8d3fe4305e3912dbe0500887e2893'
  checksum     = 'abd9b898f83fc9aeda62e2dda121b609fe0841d553f1d7f29186b0dec4f9a3b7'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
