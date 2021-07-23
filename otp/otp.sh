#!/bin/bash

# jq '[.[].name]' secrets


# jq '.[] | select(.name=="GitHub:nikhilgk").totpSecret' secrets | xargs oathtool --totp -b


# gpg --no-verbose  -q -d secrets.gpg | jq '.[] | select(.name=="GitHub:nikhilgk").totpSecret'  | xargs oathtool --totp -b




# gpg --no-verbose  -q -d secrets.gpg | jq  '[.[].name] | unique | to_entries' 



# echo $selection
# gpg --no-verbose  -q -d secrets.gpg | jq '.[] | select(.name=="GitHub:nikhilgk").totpSecret'  | xargs oathtool --totp -b
# gpg --no-verbose  -q -d secrets.gpg | cat secrets | jq  --arg selection '.[$selection].totpSecret'
# gpg --no-verbose  -q -d secrets.gpg | jq '.[] | select(.name=="GitHub:nikhilgk").totpSecret'  | xargs oathtool --totp -b



# cat secrets | jq  '[.[].name] | unique | to_entries' 
# echo -n "Enter selection #:"
# read selection
# otp=`cat secrets | jq  ".[$selection ].totpSecret" | xargs oathtool --totp -b` 
# # echo -n "$otp" | xclip -selection primary
# echo  "Copied $otp to clipboard!"

# gpg --no-verbose  -q -d secrets.gpg | jq  '[.[].name] | unique | to_entries' 
# echo -n "Enter selection #:"
# read selection
# otp=`gpg --no-verbose  -q -d secrets.gpg | jq  ".[$selection ].totpSecret" | xargs oathtool --totp -b` 
# # echo -n "$otp" | xclip -selection primary
# echo  "Copied $otp to clipboard!"


full_path=$(realpath $0)     
dir_path=$(dirname $full_path)


echo "Lookout for password prompt"
gpg --no-verbose  -q -d $dir_path/secrets.gpg | jq  '[.[].name]  | to_entries' 
echo -n "Enter selection #:"
read selection
# gpg --no-verbose  -q -d $dir_path/secrets.gpg | jq  ".[$selection ]"
otp=`gpg --no-verbose  -q -d $dir_path/secrets.gpg | jq  ".[$selection ].totpSecret" | xargs oathtool --totp -b` 
echo -n "$otp" | xclip -selection c
echo  "Copied $otp to clipboard!"
