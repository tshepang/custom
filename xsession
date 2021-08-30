# apps
firefox &
nm-applet &
trayer --edge top --align right --widthtype request --distance 19 &
xfce4-terminal --hide-menubar --tab --tab &
nautilus &
xss-lock slock &
quodlibet &

# settings
xset b off
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Super_L"
synclient TapButton1=1 TapButton2=0 TapButton3=2 MaxDoubleTapTime=100 HorizTwoFingerScroll=1
syndaemon -dti 1

# battery, loadavg, and clock
while true
do
    datetime=$( date +"%F %R" )
    load_5m=$( cat /proc/loadavg | awk '{print $1}' )
    if acpi -a | grep off-line > /dev/null
    then
        battery=$( acpi | awk '{print $4}' | sed 's/,//' )
        xsetroot -name "$battery"" | ""$load_5m"" | ""$datetime"
    else
        xsetroot -name "$load_5m"" | ""$datetime"
    fi
    sleep 5s
done &

exec dwm
