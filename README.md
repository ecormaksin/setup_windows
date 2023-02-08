# setup_windows

At first, I need to execute the below command in Windows Powershell.

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Install Apps

execute `. .\setup_pc.ps1`

## Create SymbolicLink For Powershell prompt

execute as admin `. .\create_powershell_prompt_symlink.ps1`

## Create SymbolicLink For ghq-peco script

execute as admin `. .\create_ghq-peco_symlink.ps1`

and paste the following statement on `%USERPROFILE%\scoop\apps\cmder-full\current\config\user_aliases.cmd`

```cmd
gp=C:\ws\scripts\ghq-peco.bat
```

## Change cmder prompt symbol

- `%USERPROFILE%\scoop\apps\cmder-full\current\vendor\clink.lua`
  - line 51
    - `local lambda = "$"`

or

- `%USERPROFILE%\scoop\apps\cmder-full\current\config\cmder_prompt_config.lua`
  - line 22
    - `prompt_lambSymbol = "$"`
