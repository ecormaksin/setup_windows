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
    'graphviz',
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
