$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://mirror.cs.uchicago.edu/fawkes/files/1.0/Fawkes-1.0.exe'
  checksum      = 'C972BF9D46037BBF34C6E08495DD52B1D9729999984789886A0C15DB04A603B2'
  checksumType  = 'sha256'

  FileFullPath  = "$toolsDir\fawkes.exe"
}

Get-ChocolateyWebFile @packageArgs
