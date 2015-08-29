sudo apt-get update
sudo apt-get -y install zsh git-core stow source-highlight nano
cd
git clone --recursive https://github.com/nikhilgk/ndot ~/ndot
cd ~/ndot
./basic.sh
sudo chsh -s $(which zsh) $(whoami)