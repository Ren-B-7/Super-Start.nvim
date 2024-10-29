export CARGOINSTALLPATH="$HOME/.cargo/bin"
export PATH="$CARGOINSTALLPATH:$PATH"

set -o vi
alias tvim='vim.tiny'
eval "$(rbenv init -)"

[[ -s "/home/renier/.gvm/scripts/gvm" ]] && source "/home/renier/.gvm/scripts/gvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_update="curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash"
export SUDO_ASKPASS=/usr/bin/gnome-ssh-askpass

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/renier/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/renier/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
