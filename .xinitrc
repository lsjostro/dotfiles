export PATH=$PATH:$HOME/bin
xmodmap $HOME/.Xmodmap
setxkbmap -option ctrl:nocaps,grp:switch,grp_led:scroll us,se
#xrandr --dpi 220
xsetroot -solid \#202020
xcompmgr -c &
exec $HOME/bin/dwm
