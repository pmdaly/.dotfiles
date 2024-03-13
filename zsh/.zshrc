# Environment
# source ~/.env
export PATH="$HOME/.local/bin:$PATH"

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
prompt='$(git_branch_name)%2/ $ '

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
