Set-Location $PSScriptRoot

$CurrentFolderPath = (Get-Location).Path;
$WinPwshFolderPath = "${env:USERPROFILE}\Documents\WindowsPowerShell";
$PwshFolderPath = "${env:USERPROFILE}\Documents\PowerShell";

New-Item -Path $WinPwshFolderPath -ItemType Directory -Force
New-Item -ItemType SymbolicLink -Target "${CurrentFolderPath}\Profile.ps1" -Path "${WinPwshFolderPath}\Profile.ps1" -Force

New-Item -Path $PwshFolderPath -ItemType Directory -Force
New-Item -ItemType SymbolicLink -Target "${CurrentFolderPath}\Profile.ps1" -Path "${PwshFolderPath}\Profile.ps1" -Force
New-Item -ItemType SymbolicLink -Target "${CurrentFolderPath}\Profile.ps1" -Path "${PwshFolderPath}\Microsoft.VSCode_profile.ps1" -Force
