red=$(cat /home/hs/.Xresources | grep color6 | tail -c 8)
white=$(cat /home/hs/.Xresources | grep color15 | tail -c 8)
back=$(cat /home/hs/.Xresources | grep background | tail -c 8)

WIDTH=20
HEIGHT=20
X=1840
Y=1060
FONT="-artwiz-nu-medium-r-normal-*-10-110-75-75-m-50-iso8859-*"
MUICON="/home/hs/.dzen2/phones.xbm"


icon() {
	echo "^fg($red)^i($1)^fg()"
}

while true; do
  sleep 1
echo "$(icon $MUICON)" 
done | dzen2 -p -bg $back -fg $white -w $WIDTH -h $HEIGHT -x $X -y $Y -fn $FONT -e 'button1=exec:urxvt -e ncmpcpp'
