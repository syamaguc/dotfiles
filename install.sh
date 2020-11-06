ESSENTIALS="stow \
            ack \
            silversercher-ag \
            neovim \
            vim-GTK3.0"

ADDTIONALS="fcitx \
            mozc \
            clang \
            psensor"

SNAPS="htop"

sudo apt update -y && sudo apt upgrade -y
sudo snap refresh
sudo snap set system refresh.timer=24:00


if [ "$1" == "all" ]; then

    # WSL 2 specific settings.
    if grep -q "microsoft" /proc/version &>/dev/null; then
        echo -e "\033[0;33mWSL setting\033[0;39m"
    else
        echo -e "\033[0;33Linux setting\033[0;39m"
        sudo apt install -y $ESSENTIAlS $ADDITIONALS
        sudo snap install $SNAPS
    fi
else
    echo -e "\033[0;35minstall essentials\033[0;39m"
    sudo apt install -y $ESSENTIAlS
fi
