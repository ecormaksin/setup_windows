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

## Install WSL

Execute `wsl --install -d Ubuntu`

## Install Apps

Execute the following commands (maybe as Admin).

```pwsh
. .\install_via_winget.ps1`
. .\install_via_scoop.ps1`
. .\install_via_chocolatey.ps1`
```

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

[ghq "https://github.com/<user_name>"]
  root = C:/ws/ghq/<user_name>

[ghq "git@github.com:<user_name>"]
  root = C:/ws/ghq/<user_name>

[url "https://github.com/<user_name>"]
  insteadOf = https.github.<user_name>

[url "git@github.com:<user_name>"]
  insteadOf = git.github.<user_name>

[includeIf "gitdir:C:/ws/ghq/<user_name>/"]
  path = C:/ws/ghq/<user_name>/.gitconfig
```

add `C:\ws\ghq\<github_username>\.gitconfig`

```text
[user]
  email = <mail address>
  name = <your name>
```

## Create SymbolicLink For ghq-peco script

Execute as admin `. .\create_ghq-peco_symlink.ps1`.

And paste the following statement on `%USERPROFILE%\scoop\apps\cmder-full\current\config\user_aliases.cmd`

```cmd
gp=C:\ws\scripts\ghq-peco.bat
```

## Change cmder prompt symbol

### Cmd/Clink

<https://github.com/cmderdev/cmder/wiki/Customization#prompt-symbol>

- `%USERPROFILE%\scoop\apps\cmder-full\current\config\cmder_prompt_config.lua`
  - line 22
    - `prompt_lambSymbol = "$"`

- If we want to change the prompt with variables, we need to configure `%USERPROFILE%\scoop\apps\cmder-full\current\config\cmder_prompt_config.lua` to add code blocks as follows:

  - <https://chrisant996.github.io/clink/clink.html#customizing-the-prompt>

    ```text
    ---

    cyan_color = "\x1b[36;1m"

    local my_custom_prompt = clink.promptfilter(999)
    function my_custom_prompt:filter(prompt)
      local base_prompt = cwd_color..os.getcwd()..clean_color.." ("..os.date("%Y/%m/%d %H:%M:%S")..")"
      local line = io.popen("git branch --show-current 2>nul"):read("*a")
      local branch = line:match("(.+)\n")
      local return_prompt = base_prompt
      if branch then
          return_prompt = return_prompt.." "..cyan_color.."["..branch.."]"
      end
      return return_prompt..clean_color.."\n> "
    end
    ```

### Powershell

<https://github.com/cmderdev/cmder/wiki/Customization#powershell>

- Powerline supported fons(my favorites):
  - Roboto Mono for Powerline
  - Inconsolata-g for Powerline

- Oh-My-Posh
  - Theme(my favorites):
    - honukai
    - slimfat
    - wopian
    - ys
