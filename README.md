# dotfiles
新規環境セットアップ用のdotfiles  

## preztoセットアップ  
zshに入った後に以下を実行  
```
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```
