$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdns.distrib.naviextras.com/content/!application/TOOLBOX/Agents/ReDa_ULC_4/2021_12_14_15_31/Dacia/DaciaMediaNavEvolutionToolbox-inst.exe'
  checksum     = 'eba9e6f127e48d6ced0c6dd0851add5b197282ecdba70265ad443925502e6cff'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
