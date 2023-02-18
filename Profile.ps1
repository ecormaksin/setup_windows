function prompt {
    "`r`n`r`n$($executionContext.SessionState.Path.CurrentLocation)$(' ')`($(Get-Date -Format 'yyyy/MM/dd HH:mm:ss')`)`r`n$('>' * ($nestedPromptLevel + 1)) ";
}

function ghq-peco {
    $SelectedRepository = $(ghq list -p | peco)
    Set-Location $SelectedRepository
}
