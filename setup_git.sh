#!/bin/bash


sudo apt-get install zenity 

if [[ $? -eq 0 ]]; then
zenity --info --title="Sucess !" --text="Setup succesfully finished !"
else
	echo "Failed to install packages."
fi
