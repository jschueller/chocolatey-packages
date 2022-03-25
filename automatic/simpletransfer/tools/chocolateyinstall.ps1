$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://rambax.com/simpletransfer/desktop/SimpleTransfer%20Desktop%20Setup%203.1.0.exe'
  checksum      = '7c4d3e9b4f58d1212dcf389fe42f1334459fd2ac266c0bcc9acc5c207a4c4f1c'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
