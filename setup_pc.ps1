wsl --install -d Ubuntu

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

# install scoop
irm get.scoop.sh | iex

scoop install git
git config --global credential.helper manager

$BucketNames = @(
    'java',
    'extras'
)
$BucketNames | ForEach-Object {
    & scoop bucket add $_
}

$Apps = @(
    'gow',
    'cmder-full',
    'ghq',
    'peco',
    'openjdk8-redhat',
    'openjdk11',
    'openjdk17',
    'openjdk',
    'nvm',
    'qbittorrent-enhanced',
    'everything',
    'flow-launcher'
)
$Apps | ForEach-Object {
    & scoop install $_
}

nvm install lts
# need to run `nvm use <target_version>`
