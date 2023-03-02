#!/bin/bash

# Lista de Pacotes Ubuntu;
# 0ad aisleriot arduino audacity bleachbit blender bluefish brasero cheese codeblocks-contrib codelite deluge dia discord dolphin-emu dosbox dosemu drawing dropbox dxvk easytag evince exfat-fuse file-roller filezilla firefox flatpak g++ gdebi geany-plugins geary gedit gimp git gnome-boxes gnome-disks-utility gnome-games-app gnome-mines gnome-shell gnome-software gnome-software-plugin-flatpak gnome-software-plugin-snap gnome-terminal gnome-tweak-tool gparted higan hplip-gui inkscape jstest-gtk kdenlive krita kstars librecad libreoffice linux-generic-hwe-22.04 lutris marsshooter mesa-vulkan-drivers minetest mysql-client nautilus-dropbox nvidia-340 nvidia-driver-390 nvidia-driver-470 nvidia-driver-510 nvidia-driver-525 obs-studio p7zip-rar pcsxr pidgin pinta playonlinux putty python3-wxgtk4.0 remmina rhythmbox shotcut shotwell shutter snapd sqlitebrowser steam stellarium supertuxkart telegram-desktop thunderbird transmission ubuntu-restricted-extras uget vinagre virtualbox vlc vulkan-utils wine wireshark

sudo dpkg --add-architecture i386

echo "Fazer download de pacotes e dependências do repositório;"
echo "1 - Ubuntu"
echo "2 - WineHQ"
echo "3 - Spotify"
echo "4 - Pop_OS!"
read c
case $c in
	1) # Opção para fazer download de pacotes do repositório oficial do Ubuntu.
	sudo apt update
	
	cd ~
	mkdir ~/Software
	
	for i in ;
	do
	mkdir ~/Software/$i
	sudo apt-get -d install $i -y
	cp -R /var/cache/apt/archives/*.deb ~/Software/$i
	sleep 2s
	sudo apt clean
	sleep 5s
	clear
	done
	
	sudo chmod -R 777 ~/Software
	;;
	
	2) # Opção para fazer download de pacotes do repositório WineHQ.
	sudo mkdir -pm755 /etc/apt/keyrings
	sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
	sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
	sudo apt update
	
	mkdir -p ~/Software/wine-stable ~/Software/wine-staging
	sudo apt-get -d install winehq-stable -y
	cp -R /var/cache/apt/archives/*.deb ~/Software/wine-stable
	sleep 2s
	sudo apt clean
	sleep 5s
	clear
	sudo apt-get -d install winehq-staging -y
	cp -R /var/cache/apt/archives/*.deb ~/Software/wine-staging
	sleep 2s
	sudo apt clean
	sleep 5s
	clear
	;;
	
	3) # Opção para fazer download de pacotes do repositório do Spotify.
	wget -nc https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg
	sudo apt-key add pubkey_7A3A762FAFD4A51F.gpg
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt update
	
	mkdir -p ~/Software/spotify-client
	sudo apt-get -d install spotify-client -y
	cp -R /var/cache/apt/archives/*.deb ~/Software/spotify-client
	sleep 2s
	sudo apt clean
	sleep 5s
	clear
	
	sudo rm /etc/apt/sources.list.d/spotify.list
	sudo apt-key list
	echo "Qual a ID da chave GPG a remover?"
	read keyGPG
	sudo apt-key del $keyGPG
	sudo apt update
	;;
	
	4) # Opção para fazer download de pacotes do repositório(PPA) oficial da fabricante System76.
	sudo add-apt-repository ppa:system76-dev/stable
	sudo apt update
  
	mkdir -p ~/Software/system76-power
	sudo apt-get -d install gnome-shell-extension-system76-power system76-power -y
	cp -R /var/cache/apt/archives/*.deb ~/Software/system76-power
	sleep 2s
	sudo apt clean
	sleep 5s
	clear
	
	sudo add-apt-repository --remove ppa:system76-dev/stable
	sudo apt-key list
	echo "Qual a ID da chave GPG a remover?"
	read keyGPG
	sudo apt-key del $keyGPG
	sudo apt update
	;;
	
	*) # Opção para finalizar o script.
	echo "Finalizando script."
	;;
esac
