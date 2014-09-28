#get colorsi
green=$(cat $HOME/.Xresources | grep color2 | tail -c 2)
white=$(cat $HOME/.Xresources | grep color15 | tail -c 8)
back=$(cat $HOME/.Xresources | grep background | tail -c 8)

BG_COLOR="#232323"
WIDTH=160
HEIGHT=20
X=10
Y=1050
FONT="-artwiz-nu-medium-r-normal-*-10-110-75-75-m-50-iso8859-*"
ICON="/home/hs/.dzen2/grid.xbm"

icon() {
	echo "^fg($green)^i($1)^fg()"
}

groups() {
    cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
    tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

    for w in `seq 0 $((cur - 1))`; do line="${line}^i(/home/hs/.dzen2/empty.xbm) "; done
    line="${line}^i(/home/hs/.dzen2/full.xbm)^fg($white) "
    for w in `seq $((cur + 2)) $tot`; do line="${line}^i(/home/hs/.dzen2/empty.xbm) "; done
    echo $line
}
while true; do
sleep 1
echo "$(groups)"
done | dzen2 -p -bg $back -fg $white -w $WIDTH -h $HEIGHT -x $X -y $Y -fn $FONT
