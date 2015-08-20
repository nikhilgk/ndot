MDIR=~/rem/$1 
fusermount -u $MDIR
mkdir -p $MDIR
sshfs $1:/ $MDIR
subl $MDIR/home/nikhil/
nemo $MDIR
ssh $1
