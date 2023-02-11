function prompt {
    "`r`n`r`n$($executionContext.SessionState.Path.CurrentLocation)$(' ')`($(Get-Date -Format 'yyyy/MM/dd HH:mm:ss')`)`r`n$('>' * ($nestedPromptLevel + 1)) ";
}

Set-PSReadlineKeyHandler -Key 'Ctrl+u' -Function BackwardDeleteLine
Set-PSReadlineKeyHandler -Key 'Ctrl+b' -Function BackwardChar
Set-PSReadlineKeyHandler -Key 'Ctrl+f' -Function ForwardChar
Set-PSReadlineKeyHandler -Key 'Ctrl+d' -Function DeleteChar
Set-PSReadlineKeyHandler -Key 'Ctrl+h' -Function BackwardDeleteChar
Set-PSReadlineKeyHandler -Key 'Ctrl+p' -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key 'Ctrl+n' -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key 'Ctrl+a' -Function BeginningOfLine
Set-PSReadlineKeyHandler -Key 'Ctrl+e' -Function EndOfLine

function ghq-peco {
    cd $(ghq list -p | peco)
}

Set-PSReadLineKeyHandler -Chord Ctrl+] -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("ghq-peco")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}