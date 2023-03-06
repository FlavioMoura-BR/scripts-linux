#!/bin/bash

sudo snap remove ubuntu-mate-welcome
sudo snap remove software-boutique
sudo snap remove firefox
sudo snap remove snapd-desktop-integration
sudo snap remove gtk-common-themes
sudo snap remove gnome-3-38-2004
sudo snap remove core20
sudo snap remove bare
sudo snap remove snapd

sudo apt purge snapd
sudo apt autoremove
