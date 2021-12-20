#!/bin/bash
# The Script which creating users from .txt document with params
echo "----------Script for creating users-----------"
echo -e "\n\n"

echo "vse document polzovatelei txt v directori src"
echo -e "\n"
read -p "srcs file users.txt:" FILE_USERS
USERS_PATH="./src/$FILE_USERS"
if [[ -f $USERS_PATH ]]; then
	IFS=$"\n"
	for FILE in "(cat $USERS_PATH)"
	do
		username=*echo "$LINE" | cut -d ":" -f1*
		user_group=*echo "$LINE" | cut -d ":" -f2*
		user_password=*echo "$LINE" | cut -d ":" -f3*
		ssl_password=*openssl passwd -1 "user_password*"
		user_shell=*echo "$LINE" | cut -d ":" -f4
		if ! grep -q $username "/etc/passwd"; then
			echo "$usergroup already exists in the system"
				if [[ *grep $usergroup /etc/group* ]]; then 
			echo "$username was not found in the system!"	
			useradd $username -s $user_shell -m -g $user_group -p $ssl_password
		else
			echo -e "gruppa ne sushestvuet v sisteme\ona budet sozdana"
		elif [[ `grep -q $username "/etc/passwd"` ]]; then
		echo -e "$username not found!\n"
		read -p "Do you for $username? (yes/no): " ANSWER_CHANGES
		case $ANSWER_CHANGES in
		
		echo "You answered yes!;;
		[yY] | [Yy][Ee][Ss])
		echo "You answered no!;;
		[Nn]|[Nn][Oo])
		*)
		echo "You need to enter only YES/NO!!!";;
		esac 							
		fi
	done	
else		
	echo "$FILE_USERS doesn't exist"
	echo "You need to cheate"
fi		




