# nvim-installation-package
A default package to get a vs-code like setup for nvim, with linting, lsp, formatting, auto-completion, git integration, highlighting, file trees and even trouble

# Adding external apt servers
Firstly ensure you have external servers added to apt

go to start menu > Software & Updates > tick everything under Ubuntu Software to true

Set updates to what ever, it is your pc

# Text file 1 (sudo_me)
Now copy the contents of "sudo_me.txt", paste this into the ubuntu terminal

You will likely have to press "y" a lot

This also updates the apt list, and updates all packages before hand

# Text file 2 (sudo_me_later)
Secondly do the same for "sudo_me_later.txt", paste this as well

This is an extended font format for extra images and icons added to nvim

# Finally nvim
Then finally go to ~/.config/ ("cd ~/.config/") and paste the "nvim" folder here

With command "git clone https://github.com/Ren-B-7/nvim-installation-package.git" then copy the nvim folder and paste in ~/.config/ and remove the directory nvim-installation-package

or copy it via the vscode built into gitub at "https://github.dev/Ren-B-7/nvim-installation-package/tree/main" and download the nvim file or the ones you are interested in

Or alternatively only paste/ clone the extensions you plan on using within your own nvim lua folders

# Done?
Then run nvim in your terminal, and all should be well, if not contact owner, cause you fucked up
