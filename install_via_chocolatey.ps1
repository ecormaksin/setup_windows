# install choclolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$Apps = @(
    'SakuraEditor'
)
$Apps | ForEach-Object {
    & choco install $_ --accept-license --confirm
}
