# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
alias g=hub

# alias straight to difftool for quick access
alias gdiff='g diff'

# quick aliases for common actions
alias ga='g add'
alias gc!='g commit -v'
alias gcm='g commit -m'
alias gco='g checkout'
alias gp='g push'
alias gmf='g merge --ff-only'
alias gup='g smart-pull && g remote prune origin'
alias gsup='g submodule update --init --recursive'

# log aliases
alias gl='g log --format=custom --graph'

# git rm deleted files
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
