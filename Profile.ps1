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
    &"winget" install --id $AppId --silent --accept-package-agreements --accept-source-agreements
}

function Upgrade-WingetApp {
    param (
        [Parameter(Mandatory)][String]$AppId
    )
    &"winget" upgrade --id $AppId --silent --accept-package-agreements --accept-source-agreements
}
