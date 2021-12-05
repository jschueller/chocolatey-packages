$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree11.1.3.0.msi'
  checksum      = 'ac40e8367eaf03d0d57bac9aa16fd15e7e889f9616a90885d4a1b5ad0c9b24b4'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree11.1.3.0x64.msi'
  checksum64    = '489517bac4e6a44365fe338afee27107b0432ca940b53e2303a5518965fd8e1c'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
