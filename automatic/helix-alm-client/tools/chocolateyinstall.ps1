$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2022.1.0/ttwinclientinstall.exe'
  checksum     = 'b5280432d1cc20087ecbaddbf41ab4afc323403885c9c686575e4622cd46ea2c'
  checksumType = 'sha256'

  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
