#!/bin/zsh

#Install SDKman Java & Maven
curl -s "https://get.sdkman.io" | bash

rm /root/.zshrc

stow --dir='/root/dotfiles/' .

source ~/.zshrc
source ~/.zshenv

#sdk install maven
#sdk install java 17-open

~/.config/tmux/plugins/tpm/scripts/install_plugins.sh

tail -f /dev/null