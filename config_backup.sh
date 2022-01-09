#!/bin/bash

configs=(~/.config/nvim/init.vim ~/.xmonad/xmonad.hs ~/.xmobarrc ~/.bashrc ~/.xinitc ~/.doom.d/config.el ~/.doom.d/init.el ~/.doom.d/packages.el ~/.alacritty.yml ~/.scripts/config_backup.sh /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf)

backup_location=~/github/config_backup/ 

for i in "${configs[@]}"
do
	cp -v $i $backup_location
done

(cd $backup_location;
 git add .
 git commit -m "updating configs"
 git push
)
