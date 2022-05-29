if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export SUDO_ASKPASS="$HOME/.local/bin/dpass"
export XDG_SESSION_TYPE=x11
export TERMINAL="kitty"
export EDITOR="kitty"
export GO_PATH="$HOME/.local/share/go"

DEFAULT_USER=tuna
ZSH_DISABLE_COMPFIX=true
alias v=nvim
plugins=(z git web-search copyfile copypath copybuffer zsh-autosuggestions zsh-syntax-highlighting vi-mode)

KEYTIMEOUT=0
VI_MODE_SET_CURSOR=true
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
MODE_INDICATOR="%F{white}+%f"

ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
