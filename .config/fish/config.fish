if status is-interactive
set fish_greeting
alias v="vim"
zoxide init fish | source
alias z="cd"
alias n="nvim"
alias rm="rm -rf"
alias i= "yay -S"
alias r= "yay -R"
alias rr="yay -Rns"
alias u= "yay -Syu"
alias s= "yay -Ss"
alias phonk="mpv --loop-playlist --no-audio-display ~/Music/"
alias c="clear"
alias l="eza -a --icons"
alias ls="eza -la --icons"
#if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#    exec Hyprland
#end
end
fastfetch --config examples/13.jsonc --logo arch_small
