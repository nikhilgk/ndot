sudo apt-get update
sudo apt-get -y install zsh git-core stow source-highlight nano rename
cd
git clone --recursive https://github.com/nikhilgk/ndot ~/ndot
cd ~/ndot
wget -qO- https://foicica.com/textadept/download/textadept_LATEST.x86_64.tgz | tar xvzf - -C ~/ndot
rename s/_..\*// textadept*
sudo ln -s $HOME/ndot/textadept/textadept-curses /usr/bin/nedit
./basic.sh
sudo chsh -s $(which zsh) $(whoami)

