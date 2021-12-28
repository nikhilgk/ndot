rm -rf i3
rm -rf polybar
cp -afu ~/.config/i3/ i3
cp -afu ~/.config/polybar/ polybar
git add .
git commit -m "Backing up i3 and polybar"
