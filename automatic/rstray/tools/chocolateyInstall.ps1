﻿$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir = "$(Get-ToolsLocation)\rstray"
$version    = ''

$packageArgs = @{
    packageName     = $env:ChocolateyPackageName
    Path    = "$toolsDir\redshift-tray.zip"
    Destination     = "$installDir"
}

Get-ChocolateyUnzip @packageArgs

Write-Debug "Installing $version"
Install-BinFile "rstray" "$installDir\rstray.exe"

Remove-Item $toolsDir\*.zip -ea 0