#get colorsi
green=$(cat /home/hs/.Xresources | grep color6 | tail -c 8)
white=$(cat /home/hs/.Xresources | grep color15 | tail -c 8)
back=$(cat /home/hs/.Xresources | grep background | tail -c 8)

BG_COLOR="#232323"
WIDTH=40
HEIGHT=20
X=1870
Y=1060
FONT="-artwiz-nu-medium-r-normal-*-10-110-75-75-m-50-iso8859-*"
VOLICON="/home/hs/.dzen2/spkr_01.xbm"
MUICON="/home/hs/.dzen2/phones.xbm"


icon() {
	echo "^fg($green)^i($1)^fg()"
}

volume() {
	amixer get Master | egrep -o "[0-9]+%" | tr -d "%"
          }

while true; do
sleep 1
echo "$(icon $VOLICON) $(volume)%"
done | dzen2 -p -bg $back -fg $white -w $WIDTH -h $HEIGHT -x $X -y $Y -fn $FONT  -e 'button1=exec:urxvt -e alsamixer'
