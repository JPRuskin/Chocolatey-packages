﻿$packageName= 'FileJuggler'
$installerType      = 'EXE'
$silentArgs = '/qb'
$url        = 'https://www.filejuggler.com/download/filejuggler.exe'
$checksum   = 'd734baf0c5b7fa644303f98ed5d3e7caf4f91f4ffb0915b87d69d015e6fb6f0a'
$checksumtype	= 'sha256'

$scriptPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = Join-Path $scriptPath "chocolateyInstall.ahk"
$ahkExe = 'AutoHotKey'
$ahkRun = "$Env:Temp\$(Get-Random).ahk"
Copy-Item $ahkFile "$ahkRun" -Force
Start-Process $ahkExe $ahkRun

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -checksum $checksum -ValidExitCodes @(0,1223) -ChecksumType $checksumtype
