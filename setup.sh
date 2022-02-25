#!/bin/bash
# in .dotfiles directory
ln -s $(pwd)/zsh/zshrc ~/.zshrc
ln -s $(pwd)/starship/starship.toml ~/.config/starship.toml
ln -s $(pwd)/stylua/stylua.toml ~/.config/stylua.toml
ln -s $(pwd)/ranger ~/.config/ranger
ln -s $(pwd)/kitty ~/.config/kitty
ln -s $(pwd)/gitconfig/.gitconfig ~/.gitconfig
ln -s $(pwd)/tealdeer ~/.config/tealdeer
ln -s $(pwd)/tokei/.tokeirc ~/.tokeirc
ln -s $(pwd)/latexmk/.latexmkrc ~/.latexmkrc

# brew install fzf ranger starship thefuck zoxide bat tokei tealdeer
