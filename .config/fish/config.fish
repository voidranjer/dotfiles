if status is-interactive
    # Commands to run in interactive sessions can go here
    pfetch
end

# Aliases
alias dotf='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias dfs='dotf status'
alias dfa='dotf add'
alias dfc='dotf commit'
alias dfp='dotf push'
alias dfpl='dotf pull'
alias dfd='dotf diff'
