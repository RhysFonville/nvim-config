#DEPENDENCIES

npm
git
nodejs
clangd
unzip
a nerd font (preferably Hack)

sudo apt install npm git nodejs unzip

#FONTS

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
unzip Hack.zip -d ~/.local/share/fonts
rm ~/.local/share/fonts/LICENSE.md ~/.local/share/fonts/README.md
fc-cache -fv

One line-
sudo apt install npm git nodejs unzip && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip && unzip Hack.zip -d ~/.local/share/fonts && rm ~/.local/share/fonts/LICENSE.md ~/.local/share/fonts/README.md && fc-cache -fv
