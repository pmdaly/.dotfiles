# Vim keybindings
set fish_key_bindings fish_user_key_bindings

# No greeting
set -g fish_greeting
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH

# Source Autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# should aliases be in a function?
alias ll='ls -alF -G'
alias la='ls -A'
alias l='ls -CF'
alias ff="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias fp="nvim (ff)"
alias c="cd"
alias vim="nvim"
alias icat="kitty +kitten icat"
