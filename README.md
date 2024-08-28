# nvim-installation-package
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
Head to "https://github.dev/Ren-B-7/nvim-installation-package" and download via the VsCode browser editor.

Then finally go to ~/.config/ ("cd ~/.config/") and paste the "nvim" folder here

### #2

With command "cd ~/.config" enter the .config directiry, now run "git clone https://github.com/Ren-B-7/nvim-installation-package.git" then copy the "nvim" folder and paste in ~/.config/ and remove the directory ~/.config/nvim-installation-package.

### #3

Or alternatively only download the wanted folders via github itself and paste within the ~/.config/nvim directory.

# Done?
Then run nvim in your terminal, and all should be well, if not contact owner or open a discussion and you will be responded as soon as possible.
