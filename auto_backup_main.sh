#!/bin/bash

show_menu() {
menu=$(zenity --list --title="Main Menu" --column="Option" "Backup Files" "Exit") 
case $menu in 
	"Backup Files")
		backup_files
		;;
	"Exit")
		exit 0
		;;
	*)
		zenity --error --text="Invalid option. Please try again."
		show_menu
		;;
	esac
}
backup_files() {

	SOURCE_DIR=$(zenity --file-selection --directory --title="Select Source Directory")

	DEST_DIR=$(zenity --file-selection --directory --title="Select Destination Directory")

	if [[ -z "$SOURCE_DIR" || -z "$DEST_DIR" ]]; then
		zenity --error --text="Source or destinations directory not selected."
		exit 1
	fi

	zenity --question --text="Do you want to back up from $SOURCE_DIR to $DEST_DIR ?"
	if [[ $? -ne 0 ]]; then
		exit 1
	fi

	rsync -av --delete "$SOURCE_DIR" "$DEST_DIR" | zenity --progress --pulsate --auto-close --title="Backing up..."

	if [[ $? -eq 0 ]]; then
		zenity --info --text="Backup completed succesfully."
	else
		zenity --info --title="Error" --text="Backup failed."
	fi
}
zenity --info --title="Welcome to Auto_Backup tool !" --text="Click OK to continue to the main menu."
if [[ $? -eq 0 ]]; then
	show_menu
fi