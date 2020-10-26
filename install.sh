ESSENTIALS='stow \
            ack \
            silversercher-ag \
            neovim \
            vim-GTK3.0'

ADDTIONALS='fcitx \
            mozc
            psensor'

sudo apt update -y && sudo apt upgrade -y

if [ $1 == "all" ]; then
    echo -e "\033[0;33minstall all\033[0;39m"
    sudo apt install -y $ESSENTIAlS $ADDITIONALS
else
    echo -e "\033[0;35minstall essentials\033[0;39m"
    sudo apt install -y $ESSENTIAlS
fi

