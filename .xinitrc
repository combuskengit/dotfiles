xrandr --dpi 64 &
xsetroot -cursor_name left_ptr &
compton &
unclutter &
wicd-client &
conky &
hsetroot -tile ~/gif.png  &
xautolock -time 5 -locker lock &
xrdb -merge ~/.Xresources &
urxvtd &
sxhkd &
~/.config/bspwm/panel/panel &

exec bspwm
