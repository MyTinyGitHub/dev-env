#!/bin/bash

rm /root/.zshrc
rm /root/.zshenv 

stow --dir='/root/dotfiles/' .

source ~/.zshenv
source ~/.zshrc
source ~/.p10k.zsh

#Install SDKman Java & Maven
#curl -s "https://get.sdkman.io" | bash

#sdk install maven
#sdk install java 17-open

zsh ~/.config/tmux/plugins/tpm/scripts/install_plugins.sh

tail -f /dev/null