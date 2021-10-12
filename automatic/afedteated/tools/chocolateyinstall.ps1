$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'a9d1e0a303f7c1f85d380217c166e0b373d5468e51b2382d82d4bd169cb094d47780b12c1bb5d105cb8153d5e0d7cfd6baa5ea69d48d761b78a91683be69e452'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
