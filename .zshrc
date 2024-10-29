# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

source "/home/renier/antigen.zsh"

antigen theme romkatv/powerlevel10k

antigen use oh-my-zsh

#package manager/ env support
# antigen bundle git
# antigen bundle rvm
# antigen bundle pyenv
# antigen bundle nvm
# antigen bundle npm
# antigen bundle pip
# antigen bundle gem

# #language support
# antigen bundle perl
# antigen bundle ruby
# antigen bundle python

# #os support
# antigen bundle ubuntu

# antigen bundle zoxide
# antigen bundle history

# antigen bundle asdf
# antigen bundle cpanm

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

antigen apply

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

eval "$(zoxide init zsh)"
alias cd="z"

# Start of .bashrc

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!

path=('/home/renier/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#Exit bashrc

setopt COMBINING_CHARS

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
