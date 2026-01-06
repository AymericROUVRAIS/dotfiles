#!/bin/bash

# Install script to install everything automatically

RED='\033[0;31m'
GREEN='\e[32m'
NC='\033[0m' # No Color

echo -e "${RED}  ___  ______  _____  _   _ "
echo " / _ \ | ___ \/  __ \| | | |"
echo "/ /_\ \| |_/ /| /  \/| |_| |"
echo "|  _  ||    / | |    |  _  |"
echo "| | | || |\ \ | \__/\| | | |"
echo -e "\_| |_/\_| \_| \____/\_| |_/${NC}"
                            
echo
echo "----------------------------------"
echo
echo -e "${GREEN}Installation the full Arch config${NC}"

# Variables for shorter commands
packages="bspwm zsh alacritty neovim polybar brightnessctl \
  pulsemixer openfortivpn onlyoffice-bin drawio-desktop dunst \
  texlive-most texlive-langfrench atril htop"
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
  ln -sf ~/.config/$dir $pwd/$dir 
done

# There is now left: dunstrc, .zshrc, sxhdrc
echo
for conf in $config_files; do
  if [ ! -d $HOME/.config/$dir ]; then
    echo "Creating config directory for $dir..."
    mkdir -p $HOME/.config/$dir
  else
    echo -e "${GREEN}->${NC} Directory $dir already exists"
  fi
done


# Linking config directories and files
for dir in $directories; do
  if [ ! -d $HOME$pwd/.config/$dir]; then
    echo -e "Linking the directories to ${GREEN}dotfiles${NC} repository"
    ln -sf ~/.config/$dir $pwd/$dir 
  fi
done

ln -sf $HOME/.config/sxhkd/sxhkdrc $pwd/sxhdrc 
ln -sf $HOME/.config/dunst/dunstrc $pwd/dunstrc 
ln -sf $HOME/.zshrc $pwd/zsh_config/.zshrc

echo
echo "Done linking files/directories"


# Zsh config : oh-my-zsh
echo
echo "Configuring zsh"

# Installing oh-my-zsh
rm -rf $HOME/.config/.oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "Adding zsh plugins"

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting


echo "Adding zsh theme"
cp $pwd/zsh_config/custom.zsh-theme ~/.oh-my-zsh/themes/


# alacritty colorscheme
echo
echo -e "Adding catppuccin theme to ${GREEN}alacritty${NC}"

curl -LO --output-dir ~/.config/alacritty/colorscheme https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
curl -LO --output-dir ~/.config/alacritty/colorschemes https://github.com/catppuccin/alacritty/raw/main/catppuccin-macchiato.toml



# End of Installation
echo
echo "----------------------------------"
echo -e "${GREEN}Done${NC}"
echo

