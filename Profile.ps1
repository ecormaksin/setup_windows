function prompt {
    "`r`n`r`n$($executionContext.SessionState.Path.CurrentLocation)$(' ')`($(Get-Date -Format 'yyyy/MM/dd HH:mm:ss')`)`r`n$('>' * ($nestedPromptLevel + 1)) ";
}

function ghq-peco {
    $SelectedRepository = $(ghq list -p | peco)
    Set-Location $SelectedRepository
}

function Install-WingetApp {
    param (
        [Parameter(Mandatory)][String]$AppId
    )
    &"winget" install --id $AppId --silent --accept-package-agreements --accept-source-agreements --force --disable-interactivity
}

function Upgrade-WingetApp {
    param (
        [Parameter(Mandatory)][String]$AppId
    )
    &"winget" upgrade --id $AppId --silent --accept-package-agreements --accept-source-agreements --force --disable-interactivity
}

function Uninstall-WingetApp {
    param (
        [Parameter(Mandatory)][String]$AppId
    )
    &"winget" uninstall --id $AppId --silent --force --purge --accept-source-agreements --disable-interactivity
}

function check-svn-status {
    param (
        [Parameter(Mandatory)][String]$TargetDirPath
    )
    Set-Location -Path $TargetDirPath;
    &"svn" status
}

function Set-StringForFileName {
    param (
        [Parameter(Mandatory)][String]$SourceString
    )
    return "${SourceString}" -replace '[ \t!]', '_' | Set-Clipboard -PassThru;
}