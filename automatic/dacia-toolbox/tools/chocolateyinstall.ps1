$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdns.distrib.naviextras.com/content/!application/TOOLBOX/Agents/ReDa_ULC_4/2021_12_07_16_52/Dacia/DaciaMediaNavEvolutionToolbox-inst.exe'
  checksum     = 'e2861a739d9d026838ce283350baf5cc2349192b04aafabc37701d5fac707fe3'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
