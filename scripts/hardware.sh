#get colorsi
green=$(cat /home/hs/.Xresources | grep color4 | tail -c 8)
white=$(cat /home/hs/.Xresources | grep color15 | tail -c 8)
back=$(cat /home/hs/.Xresources | grep background | tail -c 8)

WIDTH=300
HEIGHT=20
X=800
Y=1050
FONT="-artwiz-nu-medium-r-normal-*-10-110-75-75-m-50-iso8859-*"
MEMICON="/home/hs/.dzen2/mem.xbm"
CPUICON="/home/hs/.dzen2/fs_01.xbm"
NETICON="/home/hs/.dzen2/net_wired.xbm"

icon() {
	echo "^fg($green)^i($1)^fg()"
}

memused() {
    read t f <<< `grep -E 'Mem(Total|Free)' /proc/meminfo |awk '{print $2}'`
    bc <<< "scale=2; 100 - $f / $t * 100" | cut -d. -f1
}

cpuload() {
    LINE=`ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'`
    bc <<< $LINE
}

network() {
    read lo int1 int2 <<< `ip link | sed -n 's/^[0-9]: \(.*\):.*$/\1/p'`
    if iwconfig $int1 >/dev/null 2>&1; then
        wifi=$int1
        eth0=$int2
    else
        wifi=$int2
        eth0=$int1
    fi
    ip link show $eth0 | grep 'state UP' >/dev/null && int=$eth0 ||int=$wifi

    #int=eth0

    ping -c 1 8.8.8.8 >/dev/null 2>&1 && 
        echo "$int connected" || echo "$int disconnected"
}

while true; do
sleep 1
echo "$(icon $NETICON) $(network) $(icon $CPUICON) $(cpuload)% $(icon $MEMICON) $(memused)%"
done | dzen2 -p -bg $back -fg $white -w $WIDTH -h $HEIGHT -x $X -y $Y -fn $FONT
