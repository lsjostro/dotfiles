export PATH=$PATH:$HOME/bin
xmodmap $HOME/.Xmodmap
setxkbmap -option ctrl:nocaps,grp:switch,grp_led:scroll us,se
#xrandr --dpi 220
xsetroot -solid \#202020
xsetroot -cursor_name left_ptr
feh --bg-center /home/lsjostrom/etc/wallpaper.png
xcalib $HOME/.config/B140QAN02_0.icm
#compton --daemon -c -t -25 -l -25 --shadow-radius=25 --inactive-opacity 0.99 --inactive-dim 0.2 -e 0.7
exec $HOME/bin/dwm
#exec $HOME/bin/2bwm
#exec /usr/local/bin/mpwm 2>&1 | tee /tmp/mpwm.log
