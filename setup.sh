sudo apt-get update
sudo apt-get -y install zsh git-core stow source-highlight
cd
git clone https://github.com/nikhilgk/ndot ~/ndot
cd ~/ndot
./basic.sh
chsh -s $(which zsh)