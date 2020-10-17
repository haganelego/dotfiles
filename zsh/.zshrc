#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...


##############zshrcマニュアル#####################
#bashの情報をもとに書いてるけど，多分同じ
#対話モードの時に読み込まれる．(つまりターミナル起動時?)
#エイリアス,EDITOR変数,プロンプト設定などを書く
#ここでは何も出力をしてはならない
#####################################################

# ROS
source /opt/ros/melodic/setup.zsh

# 環境変数
export LANG='en_US.UTF-8'

# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完の選択を楽にする
zstyle ':completion:*' menu select

# 補完候補にファイルの種類も表示する
setopt list_types

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

#色関係の設定
autoload -Uz colors
colors
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ヒストリーに重複を表示しない
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 自動でpushdを実行
DIRSTACKSIZE=100
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups

#グローバルエイリアス
alias -g G='|grep'

#エイリアス
alias la='ls -a'
alias dirs='dirs -v'
alias t='tmuximum'
############hook関数####################

# ディレクトリ移動時，自動でls
chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        ls
    fi
}

##################自作関数##################
# hoge : メイン関数        
# _hoge: 補完関数
# compdef : 補完の登録                
############################################

####################
# tmuxのロード関数
####################

function tmux_load {
    tmux new-session -s $1 \; source-file ~/.tmux/$1
}

function _tmux_load {
    _files -W ~/.tmux/ && return 0;
    return 1
}

compdef _tmux_load tmux_load

#####################
# ROSのsourceコマンド
#####################

function rosource {
    cd ~/ros_ws/$1
    if source devel/setup.zsh; then
        echo "Activate $1"
    fi
}

function _rosource {
    _files -W ~/ros_ws/ && return 0;
    return 1
}

compdef _rosource rosource

















# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/$USER/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/$USER/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/$USER//miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/$USER//miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
