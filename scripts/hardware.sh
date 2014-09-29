#get colorsi
green=$(cat /home/hs/.Xresources | grep color4 | tail -c 8)
white=$(cat /home/hs/.Xresources | grep color15 | tail -c 8)
back=$(cat /home/hs/.Xresources | grep background | tail -c 8)

WIDTH=120
HEIGHT=20
X=800
Y=1060
FONT="-artwiz-nu-medium-r-normal-*-10-110-75-75-m-50-iso8859-*"
MEMICON="/home/hs/.dzen2/mem.xbm"
CPUICON="/home/hs/.dzen2/fs_01.xbm"
TIMEICON="/home/hs/.dzen2/clock.xbm"

icon() {
	echo "^fg($green)^i($1)^fg()"
}

memused() {
   MEM=$(free -m | grep '-' | awk '{print $3}')
	echo $MEM
}

cpuload() {
    LINE=`ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'`
    bc <<< $LINE
}

clock(){
    date '+%Y-%m-%d %H:%M'
}

while true; do
sleep 1
echo "$(icon $TIMEICON) $(clock)"
done | dzen2 -p -bg $back -fg $white -w $WIDTH -h $HEIGHT -x $X -y $Y -fn $FONT
