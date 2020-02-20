!/bin/bash

#To check if prompt is in lts
cd /etc/update-manager/
#Changing directory to your working directory
File=release-upgrades  
if grep -q Prompt=lts "$File"; 
then
echo "nothing to it's already in lts"
else
 echo "Switching to the 'lts' release channel (if 'never' or 'normal')"
 sed -i 's/Prompt=(never|normal)/Prompt=lts/g' "/etc/update-manager/release-upgrades"
fi

