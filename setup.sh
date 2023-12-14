sudo apt-get update
sudo apt-get -y install zsh git-core stow source-highlight nano micro rename
cd
git clone --recursive https://github.com/nikhilgk/ndot ~/ndot
cd ~/ndot
# wget -qO- https://github.com/orbitalquark/textadept/releases/download/textadept_11.4/textadept_11.4.linux.tgz | tar xvzf - -C ~/ndot
# rename s/_..\*// textadept*
# sudo ln -s $HOME/ndot/textadept/textadept-curses /usr/bin/nedit
./basic.sh
sudo chsh -s $(which zsh) $(whoami)

