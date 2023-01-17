# Vim keybindings
set fish_key_bindings fish_user_key_bindings

# No greeting
set -g fish_greeting
fish_add_path ~/.cargo/bin
fish_add_path "/usr/local/opt/ruby/bin"
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH
fish_add_path /opt/homebrew/bin
fish_add_path /Users/pmd/Library/Python/3.8/bin

# Source Autojump
[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

# should aliases be in a function?
alias ll='ls -alF -G'
alias la='ls -A'
alias l='ls -CF'
alias ff="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias fp="nvim (ff)"
alias c="cd"
alias vim="nvim"
alias icat="kitty +kitten icat"
# alias cat="ccat"

# Created by `pipx` on 2022-01-15 05:11:31
set PATH $PATH /Users/pmd/.local/bin

export PATH="$PATH:/Users/pmd/.foundry/bin"
