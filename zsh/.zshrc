# Environment
# source ~/.env
export PATH="$HOME/.local/bin:$PATH"

# need this for some stuff below
autoload -Uz compinit && compinit

# Set up the prompt
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch') '
  fi
}
setopt prompt_subst
#prompt='%2/ $(git_branch_name)$ '
prompt='%2/ $(git_branch_name)$ '

setopt histignorealldups sharehistory

# Use vi keybinds
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# aliases
alias ll='ls -alF -G'
alias la='ls -A'
alias l='ls -CF'
alias ff="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias fp="nvim (ff)"
alias c="cd"
alias ..='cd ..'
alias vim="nvim"
alias icat="kitty +kitten icat"

# Git 
alias gs='git status'
alias ga='git add'
alias gau='git add -u'
alias gp='git push'
alias gc='git commit'
alias gb='git branch'

# autojump
eval "$(zoxide init zsh)"

# set up fzf key bindings and fuzzy completion
# need current fzf for this to work
#source <(fzf --zsh)

# rust
. "$HOME/.cargo/env"

# UV
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
# need this nonsense to enable pass through completions
_uv_run_mod() {
    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
        _arguments '*:filename:_files'
    else
        _uv "$@"
    fi
}
compdef _uv_run_mod uv

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# poetry
fpath+=~/.zfunc

# neovim
export PATH="$HOME/.local/neovim/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# node stuff
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# fish auto suggestions
# https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# fish syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh functions
fpath+=~/.zfunc

# pull in non version control stuff
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
