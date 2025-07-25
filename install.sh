#!/bin/bash
# 這個腳本的目的是在容器內建立軟連結 (Symbolic Link)
# ln -sf [來源檔案] [目標位置]
# 來源檔案是這個 repo 內的檔案，目標位置是使用者家目錄 (~)

echo "Installing dotfiles..."

# -s: 建立 symbolic link
# -f: 如果目標已存在，強制覆蓋 (force)
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

echo "Dotfiles installation complete."
