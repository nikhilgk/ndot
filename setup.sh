sudo apt-get update
sudo apt-get -y install zsh git-core stow source-highlight nano micro rename fzf
cd
git clone --recursive https://github.com/nikhilgk/ndot ~/ndot
cd ~/ndot
# wget -qO- https://github.com/orbitalquark/textadept/releases/download/textadept_11.4/textadept_11.4.linux.tgz | tar xvzf - -C ~/ndot
# rename s/_..\*// textadept*
# sudo ln -s $HOME/ndot/textadept/textadept-curses /usr/bin/nedit
./basic.sh
echo "If fzf does not work, check version and compile and install "
sudo chsh -s $(which zsh) $(whoami)

