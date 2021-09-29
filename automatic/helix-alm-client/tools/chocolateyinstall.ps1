$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2021.2.1/ttwinclientinstall.exe'
  checksum     = 'f2054e97c512f09a554a965b9a7470a7789ae8b96e939be29d670ec0dbb273c2'
  checksumType = 'sha256'

  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
