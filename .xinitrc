export PATH=$PATH:$HOME/bin
xmodmap $HOME/.Xmodmap
setxkbmap -option ctrl:nocaps,grp:switch,grp_led:scroll us,se
#xrandr --dpi 220
xsetroot -solid \#202020
xcalib $HOME/.config/B140QAN02_0.icm
exec $HOME/bin/dwm
