$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$env:ProgramFiles\AGW_Multi_Activites"

  url           = 'http://f1agw.free.fr/AGW_Multi_Activites/AGW_Multi_Activites_127_SI.zip'
  checksum      = '208343fad9f4ae83f3263294a334a99297037cc84bdd903bc3f113e6e969377a'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "AGW Multi Activités.lnk"
$targetPath = Join-Path "$env:ProgramFiles\AGW_Multi_Activites" "AGW_Multi_Activites.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
