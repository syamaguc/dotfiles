#!/bin/bash

# ------ Get OS architecture -------
# 32bit(Intel) -> i686
# 64bit(Intel) -> x86_64
# 64bit(AMD)   -> arm64
function get_arch() {
	echo $(uname -m)
}

# ------ Get OS -------
function get_os() {
	if [ "$(uname)" == 'Darwin' ]; then
		OS='Darwin'
	elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
		OS='Linux'
	elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
		OS='Cygwin'
	else
		OS=''
	fi
	echo $OS
}

# ------ If linux, get distribution name -----
function get_distro() {
	if [ -e /etc/debian_version ] || [ -e /etc/debian_release ]; then
		# Check Ubuntu or Debian
		if [ -e /etc/lsb-release ]; then
			# Ubuntu
			distri_name="Ubuntu"
		else
			# Debian
			distri_name="Debian"
		fi
	elif [ -e /etc/arch-release ]; then
		# Arch Linux
		distri_name="Arch"
	elif [ -e /etc/fedora-release ]; then
		# Fedra
		distri_name="Fedora"
	else
		# Other
		distri_name="Unknown"
	fi
	echo $distri_name
}

# Get distribution and bit
function get_os_info() {
	echo $(get_arch) $(get_os) $(get_distro)
}

function linux_prepare() {
	useradd -m -G wheel -s /bin/bash syamaguc
	echo 'syamaguc ALL=(ALL) NOPASSWD: ALL' >>/etc/sudoers
	echo 'en_US.UTF-8 UTF-8' >/etc/locale.gen
	locale-gen
	echo 'LANG=en_US.UTF-8' >/etc/locale.conf
	ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
}

function install_yay() {
	which yay >/dev/null 2>&1
	case $? in
	0) ;;

	1)
		echo "Install yay ..."
		mkdir -p "$HOME/tmp"
		cd "$HOME/tmp" || exit
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si --noconfirm
		cd - || exit
		sudo rm -rf "$HOME/tmp/yay"
		;;
	esac
}

function skk_setting() {
	rm -rf ~/Library/Application\ Support/AquaSKK/keymap.conf
	cp /Library/Input\ Methods/AquaSKK.app/Contents/Resources/keymap.conf ~/Library/Application\ Support/AquaSKK/keymap.conf
	echo "StickyKey  ;" >>~/Library/Application\ Support/AquaSKK/keymap.conf

}

function tmux_setting() {
	if [ -f "$HOME/.tmux/plugins/tpm" ]; then
		:
	else
		git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
	fi
}

function arch_prepare() {
	pacman -Syu --noconfirm
	pacman -S sudo make stow git base-devel --noconfirm --needed
	install_yay
	cat package.pacman.txt | xargs pacman -S --noconfirm --needed

}

function ubuntu_prepare() {
	sudo apt-get update -y
	sudo apt-get install make stow -y
	cat package.apt.txt | xargs sudo apt-get install -y
}

function darwin_prepare() {
	brew update
	brew install make stow
	brew bundle --file=script/Brewfile
}

function common_after_install() {
	sudo chsh -s /bin/zsh
	tmux_setting
}

declare -a info=($(get_os_info))

get_os_info

case ${info[0]} in
"x86_64")
	if [[ ${info[1]} == "Darwin" ]]; then
		darwin_prepare
	elif [[ ${info[1]} == "Linux" ]]; then
		if [[ ${info[2]} == "Arch" ]]; then
			linux_prepare
			arch_prepare
			common_after_install
		elif [[ ${info[2]} == "Ubuntu" ]]; then
			linux_prepare
			ubuntu_prepare
			common_after_install
		else
			:
		fi
	else
		:
	fi
	;;
"arm64")
	if [[ ${info[1]} == "Darwin" ]]; then
		darwin_prepare
		common_after_install
	else
		:
	fi
	;;
*)
	echo "Sorry, 32bits is unsupported"
	;;
esac
