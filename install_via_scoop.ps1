# install scoop
irm get.scoop.sh | iex

scoop install git
git config --global credential.helper manager

$BucketNames = @(
    'extras'
)
$BucketNames | ForEach-Object {
    & scoop bucket add $_
}

$Apps = @(
    'cmder-full'
    'ghq'
    'peco'
)
$Apps | ForEach-Object {
    & scoop install $_
}

# nvm install lts
# need to run `nvm use <target_version>`
