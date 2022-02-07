#!/bin/bash
# in .dotfiles directory
ln -s $(pwd)/zsh/zshrc ~/.zshrc
ln -s $(pwd)/starship/starship.toml ~/.config/starship.toml
ln -s $(pwd)/ranger ~/.config/ranger
ln -s $(pwd)/kitty ~/.config/kitty

brew install fzf ranger starship thefuck zoxide bat
