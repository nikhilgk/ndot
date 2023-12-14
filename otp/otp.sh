#!/bin/bash

# gpg -d secrets.gpg > secrets
# mv secrets.gpg secrets.gpg.`date -Iseconds`
### Edit secrets
# gpg  -c --symmetric secrets
# rm secrets



full_path=$(realpath $0)     
dir_path=$(dirname $full_path)

if [ -z "$1" ]
  then
	gpg --no-verbose  -q -d $dir_path/secrets.gpg | jq  '[.[].name]  | to_entries' 
	echo -n "Enter selection #:"
	read selection
else
	selection=$1
fi
# gpg --no-verbose  -q -d $dir_path/secrets.gpg | jq  ".[$selection ]"
otp=`gpg --no-verbose  -q -d $dir_path/secrets.gpg | jq  ".[$selection ].totpSecret" | xargs oathtool --totp -b` 

# if a -v option is passed, print the otp to stdout and clipboard
if [ "$2" != "-q" ]
then
    echo -n "$otp" | xclip -selection c
    echo  ">>>$otp<<<" |sed -r 's/(.{3})/\1 /g'
    # exit now
    exit 0
fi 
    echo $otp


