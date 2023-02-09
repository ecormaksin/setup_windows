wsl --install -d Ubuntu

# install choclolatey
# Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
winget install Microsoft.WindowsTerminal
winget install Microsoft.PowerShell
winget install Bitwarden.Bitwarden
winget install Google.Chrome
winget install Microsoft.PowerToys
winget install SlackTechnologies.Slack
winget install Notepad++.Notepad++
winget install Microsoft.VisualStudioCode
winget install TortoiseSVN.TortoiseSVN
winget install Git.Git
winget install TortoiseGit.TortoiseGit
winget install dbeaver.dbeaver
winget install WinMerge.WinMerge
winget install Meld.Meld
winget install RedHat.Podman
winget install RedHat.Podman-Desktop

winget install Microsoft.VCRedist.2015+.x64
winget install Oracle.VirtualBox

# install scoop
irm get.scoop.sh | iex

scoop install git
git config --global credential.helper manager
scoop install gow
scoop install cmder-full
scoop install ghq
scoop install peco

scoop bucket add java
scoop install openjdk8-redhat
scoop install openjdk11
scoop install openjdk17
scoop install openjdk
scoop install nvm

nvm install lts
# need to run `nvm use <target_version>`
