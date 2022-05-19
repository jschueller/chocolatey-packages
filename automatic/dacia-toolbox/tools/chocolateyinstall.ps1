$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.naviextras.com/content/!application/TOOLBOX/Agents/ReDa_ULC_4/2022_05_13_12_03/Dacia/DaciaMediaNavEvolutionToolbox-inst.exe'
  checksum     = 'd048aa614726a5ba486f2d7828296ad2b04540cecbb96696f6e1495eb30c1dc8'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
