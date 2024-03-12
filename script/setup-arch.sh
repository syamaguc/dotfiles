#!/bin/bash

BASE=(
	# basic item
	stow tmux git man htop zsh xclip reflector
	# terminal
	alacritty
	# for japanese
	fcitx5 fcitx5-mozc fcitx5-configtool fcitx5-qt fcitx5-gtk fcitx5-nord
	# i3 & important apps
	i3 i3blocks feh rofi ranger conky picom
	# lightdm
	lightdm lightdm-gtk-greeter
	# network
	net-tools networkmanager network-manager-applet
	# Misc
	unzip wget nautilus xorg xsel jq alsa-utils neofetch xdg-user-dirs
	# for language
	npm yarn rust go
	# for python
	python-pip
	# for vim
	neovim ripgrep fzf shellcheck shfmt stylua fd deno
	# fonts
	otf-ipafont noto-fonts noto-fonts-emoji
	# sound
	pulseaudio pulseaudio-alsa pavucontrol
	# apps
	discord
	# dev
	docker docker-compose
	# GPU
	nvidia
)

AUR=(
	google-chrome
	dropbox
	ttf-ricty-diminished
	autotiling
	slack-desktop
	snapd
	clang-format-all-git
  nodejs-markdownlint-cli
)

function pacman-install() {
	printf "Install basics ...\n"

	for app in "${BASE[@]}"; do
		sudo pacman -Sy --noconfirm --needed "$app"
	done

	which yay >/dev/null 2>&1
	case $? in
	0) ;;

	1)
		printf "Install yay ...\n"
		mkdir -p "$HOME/tmp"
		cd "$HOME/tmp" || exit
		git clone https://aur.archlinux.org/yay-bin.git
		cd yay-bin || exit
		makepkg --noconfirm -si
		cd - || exit
		sudo rm -rf "$HOME/tmp/yay-bin"
		;;
	esac

}

function yay-install() {
	printf "Install AUR packages ...\n"
	for app in "${AUR[@]}"; do
		yay -Sy --noconfirm --needed "$app"
	done

}

function lightdm-setting() {
	# Fix failed to start lightdm @AMD processor
	sudo sed -i 's/^\(#?logind\)-check-graphical\s*=\s*\(.*\)/logind-check-graphical = true #\1/g' /etc/lightdm/lightdm.conf
	sudo systemctl enable lightdm
	sudo systemctl start lightdm
}

function docker-setting() {
	sudo groupadd docker
	sudo usermod -aG docker "$USER"
	newgrp docker
	sudo systemctl enable docker.service
	sudo systemctl enable containerd.service
}

function tmux-setting() {
	if [ -f "$HOME/.tmux/plugins/tpm" ]; then
    ;
	else
		git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
	fi
}

function node-setting() {
	mkdir ~/.npm-global
	npm config set prefix "$HOME/.npm-global"
	zsh
	npm install -g neovim prettier serverless
	# install nvm
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
}

function python-setting() {
	pip install -U pip
	pip install neovim black isort flake8
}

function aws-setting() {
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
	rm -rf awscliv2.zip
	rm -rf aws
}

function other-setting() {
	sudo chsh -s /bin/zsh
	sudo systemctl enable NetworkManager
	sudo systemctl start NetworkManager
	sudo systemctl enable snapd
	sudo systemctl enable --now snapd.apparmor
	sudo systemctl restart snapd
	sudo snap install tradingview
}

pacman-install
yay-install
lightdm-setting
tmux-setting
docker-setting
node-setting
python-setting
other-setting
aws-setting
