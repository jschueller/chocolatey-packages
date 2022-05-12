$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'd6aeb799efa14532ded59d56e64b52c6338b999effd90db5e9faa2f38d36b1b2254d16c878775a03feaaf247c6500791b26782bc82508d001e0597b0fb26a8f7'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
