$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Omni-Rig *'
  unzipLocation = $toolsDir
  file          = "$toolsDir\OmniRigSetup.exe"  
  fileType      = 'exe'

  url           = 'http://www.dxatlas.com/OmniRig/Files/OmniRig.zip'
  checksum      = '46654ec3ba2fe9ff23a21edaa657c46e0e9867b62b254968a3c4436dd81531a8'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'  
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
