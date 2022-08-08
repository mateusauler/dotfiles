#!/bin/bash

paru -S --needed neovim astronvim neovide nerd-fonts-complete xclip
paru -S --asdeps --needed lazygit python python-neovim nodejs

if [ -e ~/.config/nvim ] ;
then
	mv ~/.config/nvim ~/.config/nvim-bkp
fi

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
