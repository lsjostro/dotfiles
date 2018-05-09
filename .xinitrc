xmodmap $HOME/.Xmodmap
setxkbmap -option ctrl:nocaps,grp:switch,grp_led:scroll us,se
#xrandr --dpi 220
xsetroot -solid \#202020
exec $HOME/bin/dwm
