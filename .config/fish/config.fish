if status is-interactive
    set fish_greeting
    zoxide init fish | source
    fzf --fish | source
    starship init fish | source
    enable_transience
end
