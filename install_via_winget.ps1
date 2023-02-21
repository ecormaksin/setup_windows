# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
$AppIds = @(
    'Microsoft.WindowsTerminal',
    'Microsoft.PowerShell',
    'Google.JapaneseIME',
    'Bitwarden.Bitwarden',
    'Google.Chrome',
    'Microsoft.PowerToys',
    'Microsoft.PCManager.CN',
    'SlackTechnologies.Slack',
    'Notepad++.Notepad++',
    'Microsoft.VisualStudioCode',
    'TortoiseSVN.TortoiseSVN',
    'Git.Git',
    'TortoiseGit.TortoiseGit',
    'dbeaver.dbeaver',
    'WinMerge.WinMerge',
    'Meld.Meld',
    'RedHat.Podman',
    'RedHat.Podman-Desktop',
    'CubeSoft.CubePDFUtility',
    'CubeSoft.CubePDF',
    'JGraph.Draw',
    'Microsoft.VCRedist.2015+.x64',
    'Oracle.VirtualBox'
)
$AppIds | ForEach-Object {
    & winget install --id $_ --silent --accept-package-agreements --accept-source-agreements
}
