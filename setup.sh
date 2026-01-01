#!/usr/bin/env bash

# in .dotfiles directory
ln -s $(pwd)/fish ~/.config/fish
ln -s $(pwd)/flashspace ~/.config/flashspace
ln -s $(pwd)/raycast ~/.config/raycast
ln -s $(pwd)/skhd ~/.config/skhd
ln -s $(pwd)/yabai ~/.config/yabai
ln -s $(pwd)/sketchybar ~/.config/sketchybar
ln -s $(pwd)/yazi ~/.config/yazi
ln -s $(pwd)/lazygit ~/.config/lazygit
ln -s $(pwd)/fastfetch ~/.config/fastfetch
ln -s $(pwd)/karabiner ~/.config/karabiner
ln -s $(pwd)/zsh/zshrc ~/.zshrc
ln -s $(pwd)/bat ~/.config/bat
ln -s $(pwd)/bottom ~/.config/bottom
ln -s $(pwd)/helix ~/.config/helix
ln -s $(pwd)/zsh/zshenv ~/.zshenv
ln -s $(pwd)/starship/starship.toml ~/.config/starship.toml
ln -s $(pwd)/stylua/stylua.toml ~/.config/stylua.toml
ln -s $(pwd)/kitty ~/.config/kitty
ln -s $(pwd)/gitconfig/.gitconfig ~/.gitconfig
ln -s $(pwd)/tealdeer ~/.config/tealdeer
ln -s $(pwd)/tokei/.tokeirc ~/.tokeirc
ln -s $(pwd)/latexmk/.latexmkrc ~/.latexmkrc

brew install yazi skhd yabai sketchybar fzf fd fish ripgrep starship fastfetch thefuck zoxide bat eza tokei tealdeer bottom helix flashspace raycast
