$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ultraviewer.net/en/UltraViewer_setup_6.5_en.exe'
  checksum     = 'e8fd64e8b7720b7f329a63157c128063ce1fced8ef1107dca9d857b9bd7c4149'
  checksumType = 'sha256'  

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
