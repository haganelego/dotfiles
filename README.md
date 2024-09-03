# dotfiles
新規環境セットアップ用のdotfiles  

## リポジトリのクローン  
1. dotfilesをクローン  
   ```sh
    cd $HOME/usr
    git clone https://github.com/haganelego/dotfiles.git
    cp dotfiles/.zshrc ~/
   ```

## zshのセットアップ  
1. zshをインストール:
    ```sh
    sudo apt install zsh
    ```
2. zshをデフォルトのシェルに設定します:
    ```sh
    chsh -s $(which zsh)
    ```
3. zshの設定のシンボリックリンク:
    ```sh
    ./zsh/install.sh
    ```
4. starshipの設定ファイルをコピーします:
    ```sh
    cp dotfiles/starship.toml ~/.config/starship.toml
    ```
5. zshの設定ファイルにstarshipの初期化を追加します:
    ```sh
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    ```
6. fzfのインストール
    ```sh
    ./tmuximum/install_fzf.sh
    ```
