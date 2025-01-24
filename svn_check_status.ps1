Param(
    [Parameter(Mandatory)][String]$SvnRootDirectoryPath
)

$OutputEncoding = [System.Text.Encoding]::GetEncoding('shift_jis')

Get-ChildItem -Path $SvnRootDirectoryPath -Recurse -Directory -Include @('.svn') -Hidden | ForEach-Object {
    $TargetDirectory = $_.FullName
    $TargetDirectory = $TargetDirectory -replace '\\\.svn', ''

    Set-Location -Path $TargetDirectory

    $output = & svn status

    if ($nulll -eq $output) {
        return
    }

    Write-Host ''
    Write-Host $TargetDirectory
    Write-Host $output
}
