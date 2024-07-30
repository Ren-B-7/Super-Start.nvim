# nvim-installation-package
A default package to get a vs-code like setup for nvim, with linting, lsp, formatting, auto-completion, git integration, highlighting, file trees and even trouble

Firstly ensure you have external servers added to apt
go to
start menu > Software & Updates > tick everything under Ubuntu Software to true
Set updates to what ever it is your pc

Now copy the contents of sudo_me.txt
Paste this into the ubuntu terminal
You will likely have to press "y" a lot
This also updates the apt list, and updates all packages before hand

Secondly do the same for sudo_me_later.txt
Paste this as well

You can remove the files ~/.local/share/font/nerd-font but keep NerdFonts
This is an extended font format for extra images and icons added to nvim

Then finally go to ~/.config/ and paste the "nvim.zip" file here and do command "unzip ~/.local/nvim.zip", or alternatively extract elsewhere and pastethe nvim file here

Then run nvim in your terminal, and all should be well
