# Super-start.nvim
A default package to get a vs-code like setup for nvim, with linting, lsp, formatting, auto-completion, git integration, highlighting, file trees and even trouble

# Adding external apt servers
Firstly ensure you have external servers added to apt

go to start menu > Software & Updates > tick everything under Ubuntu Software to true

Set updates to what ever, it is your pc

# Text file 1 (sudo_me)

## Note
Neovim does get installed via Snap, if it is installed via apt, you will have to remove it.
##
Now copy the contents of "sudo_me.txt", paste this into the ubuntu terminal

You will likely have to press "y" a lot

This also updates the apt list, and updates all packages before hand

# Text file 2 (sudo_me_later)
Secondly do the same for "sudo_me_later.txt", paste this as well

This is an extended font format for extra images and icons added to nvim

# Finally nvim-lua packages

## Recommended

Head to tags and set tag to the latest version and donwload the .zip and paste the extracted nvim folder in ~/.config/

## Other methods

### #1
Head to ```https://github.dev/Ren-B-7/Super-Start.nvim``` and download via the VsCode browser editor.

Then finally go to ```~/.config/``` and paste the "nvim" folder here

### #2

With command ```cd ~/.config``` enter the .config directiry, now run ```git clone --branch tag-name --single-branch https://github.com/Ren-B-7/nvim-installation-package.git``` then copy the "nvim" folder and paste in ```~/.config/``` and remove the directory ```~/.config/nvim-installation-package```.

### #3
Or alternatively only download the wanted folders via github itself and paste within the ```~/.config/nvim directory```.

# Done?
Then run nvim in your terminal, and all should be well, if not contact owner or open a discussion and you will be responded as soon as possible.

# Terminal to use
I recommend using WezTerm with ZSH, it provides easy use with the normal terminal commands and plugins for further use and customization.

## WezTerm
WezTerm is a replacement for tmux, it provides easy of use and better rounding, with easier/ better customization

### Installation
```Sudo apt install wezterm```

And drop the .wezterm.lua file at root ```~/.wezterm.lua``` for config  
Just add your own font from the Nerd font directory ```~/.local/share/fonts/NerdFonts```

## ZSH
Zsh is a replacement for bash, it provides better/ easier language support and is easier to use and read

### Installation
```Sudo apt install zsh```

Then install Antigen for plugin use  

-- Antigen install  
```curl -L git.io/antigen > antigen.zsh```

-- PowerLevel10K install  
Clone the repository  
```git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k```

Add  
```
ZSH_THEME="powerlevel10k/powerlevel10k"
antigen theme romkatv/powerlevel10k
```
to your ~/.zshrc file

-- .zshrc file setup  
Add the wanted plugins and themes from [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) using this [documentation](https://github.com/zsh-users/antigen)

Please not there is code to handle having multiple configs at once, this is within the nvims function  
Each entry must be the name of a different config file, defualt would be the Nvim config file, this allows for multiple diffferent configs to choose from

##
REMEMBER TO RELAUNCH AND RUN ```source ~/.zshrc``` after all installations and updates
##
My personal .zshrc file is given as an example, i dont recommend mine since i have many other installs as well
