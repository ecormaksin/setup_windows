function prompt {
    "`r`n`r`n$($executionContext.SessionState.Path.CurrentLocation)$(' ')`($(Get-Date -Format 'yyyy/MM/dd HH:mm:ss')`)`r`n$('>' * ($nestedPromptLevel + 1)) ";
}

function Set-GHQFolder {
    $SelectedRepository = $(ghq list -p | peco)
    Set-Location $SelectedRepository
}

function Install-WingetApp {
    param (
        [Parameter(Mandatory)][String]$AppId
    )
    &"winget" install --id $AppId --silent --accept-package-agreements --accept-source-agreements --force --disable-interactivity
}

function Update-WingetApp {
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

function Get-SVNStatus {
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

    $ReplacedString = "${SourceString}";
    $ReplacedString = ("${ReplacedString}" -replace '[ \t!]', '_');
    $ReplacedString = ("${ReplacedString}" -replace "['\?]", '');

    return "${ReplacedString}" | Set-Clipboard -PassThru;
}