sudo apt update -y
sudo apt upgrade -y
sudo snap refresh
sudo snap set system refresh.timer=24:00


if [ "$1" == "all" ]; then
    # WSL 2 specific settings.
    if grep -q "microsoft" /proc/version &>/dev/null; then
        echo -e "\033[0;33mWSL setting\033[0;39m"
    else
        echo -e "\033[0;33Linux setting\033[0;39m"
        # essentials
        sudo apt install -y stow
        sudo apt install -y ack
        apt-get install  -y silversearcher-ag
        sudo apt install -y neovim
        # additionals
        sudo apt install -y fcitx
        sudo apt install -y x11-apps
        sudo apt install -y clang
        sudo apt install -y psensor
        # snaps
        sudo snap install htop
    fi
else
    echo -e "\033[0;35minstall essentials\033[0;39m"
    apt-get  install -y silversearcher-ag
    sudo apt install -y stow \
                        ack \
                        neovim
fi

./symlink.sh
