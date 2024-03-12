source $ZDOTDIR/zshrc


# tmux auto start
tmux has-session &>/dev/null
if [[ $? = 0 && ! -n $TMUX ]]; then
    echo "There are session"
    echo "---------------------------------"
    tmux ls
    echo "---------------------------------"
    echo "Do you attach? (y/n)"
    read ans
    case $ans in
        "")
            tmux a
            ;;
        "y")
            tmux a
            ;;
        "n")
            ;;
        *)
            ;;
    esac
fi


# for mise
eval "$(~/.local/bin/mise activate zsh)"

# bun completions
[ -s "/Users/syamaguc/.bun/_bun" ] && source "/Users/syamaguc/.bun/_bun"
