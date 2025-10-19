#!/usr/bin/env bash

rm -rf ~/.cache/jdtls
rm -rf ~/.cache/nvim

[ -d ~/.local/share/nvim ] && mv ~/.local/share/nvim ~/.local/share/nvim.bak
[ -d ~/.local/state/nvim ] && mv ~/.local/state/nvim ~/.local/state/nvim.bak
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak

# Needed by neovim -> mason
which julia || sudo pacman -S julia
which node || sudo pacman -S nodejs
which rustup || sudo pacman -S rustup
which lua || sudo pacman -S lua
which make || sudo pacman -S make
which composer || sudo pacman -S composer
which stow || sudo pacman -S stow
which terraform || sudo pacman -S terraform
which aws || yay -S awscli

pacman -Qe|grep -q nerd-font
if [ $? -ne 0 ]; then
    sudo pacman -S otf-font-awesome ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono ttf-profont-nerd 
fi

# Work stuff...
lspci | grep VMware && sudo pacman -S jdk-openjdk maven docker docker-compose # open-vm-tools-desktop

rustup install stable

cd $(dirname $0)/..

stow --target="$HOME" nvimdots

nvim --headless -c 'quitall'
nvim --headless "+AstroUpdate" +qa
nvim --headless "+MasonUpdate" +qa
