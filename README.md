# setup_windows

At first, I need to execute the below command in Windows Powershell.

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Configure SSH

download ssh key file under `%USERPROFILE%\.ssh\personal`, then add the following block to `%USERPROFILE%\.ssh\config`

```text
Host ecormaksin.github.com
  HostName github.com
  IdentityFile ~/.ssh/personal/id_ed25519
  User git
  TCPKeepAlive yes
  IdentitiesOnly yes
```

## Install Apps

execute `. .\setup_pc.ps1`

## Create SymbolicLink For Powershell prompt

execute as admin `. .\create_powershell_prompt_symlink.ps1`

## Configure Git config

[reference](https://memo.koumei2.com/ghq-%E3%81%A7-github-%E3%81%AE%E8%A4%87%E6%95%B0%E3%81%AE%E3%82%A2%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%92%E4%BD%BF%E3%81%86/)

add the following block to `%USERPROFILE%\.gitconfig` (WIP)

```text
[ghq]
  root = C:/ws/ghq

[ghq "https://github.com/ecormaksin"]
  root = C:/ws/ghq/ecormaksin

[url "git@ecormaksin.github.com:ecormaksin"]
  insteadOf = https://github.com/ecormaksin

[includeIf "gitdir:C:/ws/ghq/ecormaksin"]
  path = C:/ws/ghq/ecormaksin/.gitconfig
```

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
