#!/usr/bin/env bash

rm -rf ~/.cache/jdtls
rm -rf ~/.cache/nvim

[ -d ~/.local/share/nvim ] && mv ~/.local/share/nvim ~/.local/share/nvim.bak
[ -d ~/.local/state/nvim ] && mv ~/.local/state/nvim ~/.local/state/nvim.bak
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak

# Needed by neovim -> mason
which composer || sudo apt install composer
which julia || sudo snap install julia --classic

sudo curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage --output /usr/local/bin/nvim
sudo chmod +x /usr/local/bin/nvim

fc-cache -fv | grep NerdFonts
if [ $? -ne 0 ]; then
	[ ! -d ~/nerd-fonts ] && git clone --depth 1 https://github.com/ryanoasis/nerd-fonts ~/nerd-fonts
	cd ~/nerd-fonts
	chmod +x install.sh
	sudo ./install.sh
fi

sudo apt install -y python3.11-venv luarocks lua5.4 liblua5.4-dev
rustup install stable

cd $(dirname $0)/..

stow --target="$HOME" ./nvimdots

nvim --headless -c 'quitall'
nvim --headless "+AstroUpdate" +qa
nvim --headless "+AstroMasonUpdateAll" +qa
