#!/bin/bash


sudo apt-get install zenity 
chmod u+x auto_backup_main.sh
if [[ $? -eq 0 ]]; then
zenity --info --title="Sucess !" --text="Setup succesfully finished !"
./auto_backup_main.sh
else
	echo "Failed to install packages."
fi
