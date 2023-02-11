# setup_windows

At first, you need to execute the below command in Windows Powershell.

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Configure SSH

Create `%USERPROFILE%\.ssh\config` as follows:

```text
Host *
  ServerAliveInterval 60
  ServerAliveCountMax 5
  AddKeysToAgent yes
  IdentitiesOnly yes
  TCPKeepAlive yes

Include */config
```

Download ssh key file under `%USERPROFILE%\.ssh`, then save the following configuration as `%USERPROFILE%\.ssh\<github_username>\config`

```text
Host <github_username>.github.com
  HostName github.com
  IdentityFile ~/.ssh/<identyty_filename>
  User git
```

## Install Apps

Execute `. .\setup_pc.ps1`.

## Change the prompt string of Command Prompt

Execute `. .\set_env_var_for_cmd.ps1`.

## Create SymbolicLink For Powershell prompt

Execute as admin `. .\create_powershell_prompt_symlink.ps1`.

## Configure Git config

[reference](https://memo.koumei2.com/ghq-%E3%81%A7-github-%E3%81%AE%E8%A4%87%E6%95%B0%E3%81%AE%E3%82%A2%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%92%E4%BD%BF%E3%81%86/)

Add the following block to `%USERPROFILE%\.gitconfig`.

```text
[ghq]
  root = C:/ws/ghq/default

[ghq "https://github.com/<github_username>"]
  root = C:/ws/ghq/<github_username>

[url "git@<github_username>.github.com:<github_username>"]
  insteadOf = https://github.com/<github_username>

[includeIf "gitdir:C:/ws/ghq/<github_username>"]
  path = C:/ws/ghq/<github_username>/.gitconfig
```

add `C:\ws\ghq\<github_username>\.gitconfig`

```text
[user]
  email = <mail address>
  name = <your name>
```

When you use `ghq get`, you need to specify repository url as https protocol, not ssh.

## Create SymbolicLink For ghq-peco script

Execute as admin `. .\create_ghq-peco_symlink.ps1`.

And paste the following statement on `%USERPROFILE%\scoop\apps\cmder-full\current\config\user_aliases.cmd`

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
