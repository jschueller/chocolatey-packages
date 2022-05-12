$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Stop Launchy
$process = Get-Process Launchy | Out-Null
If ($process) { $process | Stop-Process }

# Remove previous version
Get-ChildItem -Directory -Path $toolsDir -Filter Launchy* | Remove-Item -Force -Recurse

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\Launchy-3.1.3-win-x86.7z"
}

foreach ($file in 'python.exe', 'pythonw.exe') {
  New-Item -path $toolsDir\Launchy -name "$file.ignore" -type File -force | Out-Null
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $packageArgs.file | Out-Null

$launchy_Exe = (Get-ChildItem "$toolsDir" -Recurse Launchy.exe )

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Launchy.lnk"
$targetPath = Join-Path $toolsDir "Launchy\Launchy.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
