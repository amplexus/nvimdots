#!/usr/bin/env bash

rm -rf ~/.cache/jdtls
rm -rf ~/.cache/nvim

[ -d ~/.local/share/nvim ] && mv ~/.local/share/nvim ~/.local/share/nvim.bak
[ -d ~/.local/state/nvim ] && mv ~/.local/state/nvim ~/.local/state/nvim.bak
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak

# Needed by neovim -> mason
which julia || sudo snap install julia --classic

which curl || sudo apt install curl

sudo curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage 
sudo chmod +x ./nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage  /usr/local/bin/nvim
sudo chmod +x /usr/local/bin/nvim

fc-cache -fv | grep NerdFonts
if [ $? -ne 0 ]; then
	[ ! -d ~/nerd-fonts ] && git clone --depth 1 https://github.com/ryanoasis/nerd-fonts ~/nerd-fonts
	cd ~/nerd-fonts
	chmod +x install.sh
	sudo ./install.sh
fi

which nodejs || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash && nvm install v22.17.0

sudo apt install -y python3-venv luarocks lua5.4 liblua5.4-dev make composer stow awscli 

# Work stuff...
lspci | grep VMware && sudo apt install -y openjdk-24-jdk maven docker.io docker-compose open-vm-tools-desktop && sudo snap install terraform --classic

rustup install stable

cd $(dirname $0)/..

stow --target="$HOME" nvimdots

nvim --headless -c 'quitall'
nvim --headless "+AstroUpdate" +qa
nvim --headless "+MasonUpdate" +qa
