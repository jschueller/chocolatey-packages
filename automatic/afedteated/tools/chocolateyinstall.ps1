$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'b60e94bca5fa5e70d77c31a9f2b29555031d565a931bd9f23ba1f98673559f3036ef3b06915252833a6cbf4f8bc0196e3ebc1ec8e02066623ac449d73e534d93'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
