$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdns.distrib.naviextras.com/content/!application/TOOLBOX/Agents/ReDa_ULC_4/2022_01_05_10_59/Dacia/DaciaMediaNavEvolutionToolbox-inst.exe'
  checksum     = 'a3f62456394bc9089398838356f1f1d7dbd018d1a6ec6461aa545e1afd874ea0'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
