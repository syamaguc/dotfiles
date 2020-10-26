ESSENTIALS='stow \
            ack \
            silversercher-ag \
            neovim \
            vim-GTK3.0'

ADDTIONALS='fcitx \
            mozc \
            psensor'

SNAPS='htop'

sudo apt update -y && sudo apt upgrade -y
sudo snap refresh
sudo snap set system refresh.timer=24:00


if [ "$1" == "all" ]; then
    echo -e "\033[0;33minstall all\033[0;39m"
    sudo apt install -y $ESSENTIAlS $ADDITIONALS
    sudo snap install $SNAPS
else
    echo -e "\033[0;35minstall essentials\033[0;39m"
    sudo apt install -y $ESSENTIAlS
fi

