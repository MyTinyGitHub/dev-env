from alpine:edge 

#Install basic tools
RUN apk add git lazygit neovim ripgrep alpine-sdk tmux stow zoxide fzf curl zip --update

#Intall zsh
RUN apk add zsh --update
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Install go
RUN apk add go --update 
RUN export PATH=$PATH:/usr/local/go/bin

RUN mkdir -p /root/.config/nvim
RUN mkdir -p /root/init
RUN mkdir -p /root/dotfiles
RUN mkdir -p /root/workspace

ADD ./config/tmux/tmux.conf /root/.config/tmux/tmux.conf

RUN git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm/
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

WORKDIR /root/workspace

CMD ["/root/init/init.sh"]