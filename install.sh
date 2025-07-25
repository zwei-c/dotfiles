#!/bin/bash
# install.sh - 完整版

echo "🚀 Starting personal environment setup..."

# --- 1. 安裝 Oh My Zsh ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "✅ Oh My Zsh is already installed."
fi

# 定義 Oh My Zsh 的自訂資料夾路徑，方便後續使用
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# --- 2. 安裝主題和外掛 (如果不存在) ---

# 安裝 Powerlevel10k 主題
if [ ! -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
else
    echo "✅ Powerlevel10k theme is already installed."
fi

# 安裝 zsh-autosuggestions 外掛
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
else
    echo "✅ zsh-autosuggestions plugin is already installed."
fi

# 安裝 zsh-syntax-highlighting 外掛
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
else
    echo "✅ zsh-syntax-highlighting plugin is already installed."
fi


# --- 3. 建立設定檔的軟連結 ---
echo "Applying custom dotfiles by creating symlinks..."

# 將 repo 中的 .zshrc 連結到家目錄
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# 將 repo 中的 .p10k.zsh 連結到家目錄
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh

# 其他您想連結的檔案，例如 .gitconfig
# ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

echo "🎉 Personal environment setup complete!"