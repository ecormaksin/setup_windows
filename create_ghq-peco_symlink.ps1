Set-Location $PSScriptRoot

$CurrentFolderPath = (Get-Location).Path;
$WorkspaceScriptsFolderPath = "${env:HOMEDRIVE}\ws\scripts";

New-Item -Path $WorkspaceScriptsFolderPath -ItemType Directory -Force
New-Item -ItemType SymbolicLink -Target "${CurrentFolderPath}\ghq-peco.bat" -Path "${WorkspaceScriptsFolderPath}\ghq-peco.bat" -Force
