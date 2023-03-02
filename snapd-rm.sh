#!/bin/bash

# Remover todos os snaps do Ubuntu.
sudo snap remove firefox
sudo snap remove snap-store
sudo snap remove gnome-3-38-2004
sudo snap remove gtk-common-themes
sudo snap remove snapd-desktop-integration
sudo snap remove core20
sudo snap remove bare
sudo snap remove snapd

# Atualizar repositórios do Ubuntu e instalar suporte completo ao flatpak (flatpak + gnome software + plugin flatpak na gnome software).
sudo apt update
sudo apt install flatpak -y

sudo apt install gnome-software -y
sudo apt install gnome-software-plugin-flatpak -y

# Adicionar repositório do Flathub ao Ubuntu.
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Remover e bloquear snaps instalados via apt.
sudo apt purge snapd -y
sudo apt autoremove -y

sudo echo "# To prevent repository packages from triggering the installation of Snap,
# this file forbids snapd from being installed by APT.
# For more information: https://linuxmint-user-guide.readthedocs.io/en/latest/snap.html

Package: snapd
Pin: release a=*
Pin-Priority: -10" > /etc/apt/preferences.d/nosnap.pref

# Automatizar a instalação do navegador Mozilla Firefox via flatpak (Escolha do usuário).
echo "Instalar o navegador Mozilla Firefox via flatpak? [S,n]"
read input
if [[ $input == "S" || $input == "s" ]]; then
	flatpak install flathub org.mozilla.firefox -y
else
	echo "Finalizando Shell Script."
	exit
fi
