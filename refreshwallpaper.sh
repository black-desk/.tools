#/bin/bash

export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/
wget -O $my_tools_dir/wallpaper.jpg https://unsplash.it/1920/1080/?random
gsettings set org.gnome.desktop.background picture-uri file:///$my_tools_dir/wallpaper.jpg
