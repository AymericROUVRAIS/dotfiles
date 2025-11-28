#!/bin/bash

# Install script to install everything automatically

RED='\033[0;31m'
GREEN='\e[32m'
NC='\033[0m' # No Color

echo -e "${RED}  ___  ______  _____  _   _ "
echo" / _ \ | ___ \/  __ \| | | |"
echo"/ /_\ \| |_/ /| /  \/| |_| |"
echo"|  _  ||    / | |    |  _  |"
echo"| | | || |\ \ | \__/\| | | |"
echo"\_| |_/\_| \_| \____/\_| |_/${NC}"
                            
echo
echo "----------------------------------"
echo
echo "${GREEN}Installation the full Arch config${NC}"

# Variables for shorter commands
packages="bspwm zsh alacritty neovim polybar brightnessctl \
  pulsemixer openfortivpn onlyoffice-bin drawio-desktop dunst \
  texlive-most texlive-langfrench"
directories="nvim alacritty bspwm polybar"
config_files="dunst sxhkd"

# Installing the packages
echo
echo "Installing/updating the packages"
sudo pacman -Syu --noconfirm $packages

echo "----------------------------------"

for dir in $directories; do
  if [ ! -d $HOME/.config/$dir ]; then
    echo "Creating config directory for $dir..."
    mkdir -p $HOME/.config/$dir
  else
    echo "${GREEN}->${NC} Directory $dir already exists"
  fi
done

for dir in $directories; do
  echo -e "Linking the directories to ${GREEN}dotfiles${NC} repository"
  ln -sf ./$dir ~/.config/$dir
done

# There is now left: dunstrc, .zshrc, sxhdrc
echo
for conf in $config_files; do
  if [ ! -d $HOME/.config/$dir ]; then
    echo "Creating config directory for $dir..."
    mkdir -p $HOME/.config/$dir
  else
    echo "${GREEN}->${NC} Directory $dir already exists"
  fi
done


# Linking config directories and files
for dir in $directories; do
  if [ ! -d $HOME./.config/$dir]; then
    echo -e "Linking the directories to ${GREEN}dotfiles${NC} repository"
    ln -sf ./$dir ~/.config/$dir
  fi
done

ln -sf ./sxhdrc $HOME/.config/sxhkd/sxhkdrc
ln -sf ./dunstrc $HOME/.config/dunst/dunstrc
ln -sf ./.zshrc $HOME/.zshrc

echo
echo "Done linking files/directories"

echo
echo "----------------------------------"
echo -e "${GREEN}Done${NC}"
echo

