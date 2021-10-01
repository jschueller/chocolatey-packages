$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# The code structure for this from https://chocolatey.org/packages/hackfont

Remove-Item $toolsDir\*.tar.gz -ErrorAction SilentlyContinue

# create temp directory
do {
    $tempPath = Join-Path -Path $env:TEMP -ChildPath ([System.Guid]::NewGuid().ToString())
} while (Test-Path $tempPath)
New-Item -ItemType Directory -Path $tempPath | Out-Null
 
$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url            = 'https://github.com/liberationfonts/liberation-fonts/files/7261482/liberation-fonts-ttf-2.1.5.tar.gz'
    checksum       = '7191c669bf38899f73a2094ed00f7b800553364f90e2637010a69c0e268f25d0'
    checksumType   = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    destination    = "$tempPath"    
    file           =  (Get-ChildItem "$toolsDir\liberation-fonts-ttf-*.tar").FullName
}
Get-ChocolateyUnzip @packageArgs

# Obtain system font folder for extraction
$shell = New-Object -ComObject Shell.Application
$fontsFolder = $shell.Namespace(0x14)
 
# Loop the extracted files and install them
Get-ChildItem -Path $tempPath -Recurse -Filter '*.ttf' | ForEach-Object { 
    Write-Verbose "Registering font '$($_.Name)'."
    $fontsFolder.CopyHere($_.FullName)  # copying to fonts folder ignores a second param on CopyHere
}
 
# Remove our temporary files
Remove-Item $tempPath -Recurse -ErrorAction SilentlyContinue
 
Write-Warning 'If the fonts are not available in your applications or receive any errors installing or upgrading, please reboot to release the font files.'
