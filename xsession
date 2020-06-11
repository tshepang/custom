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

~/blog && zola serve &
mdbook serve $HOTROD_PATH/docs/dev --port 5000 --websocket-port 5001 &
mdbook serve $HOTROD_PATH/docs/ops --port 9000 --websocket-port 9001 &
mdbook serve ~/rust/rustc/src/tools/cargo/src/doc --port 7000 --websocket-port 7001 &
$HOTROD_PATH/src/web/site && zola serve --port 8000 &

# clock
while true
do
    datetime=$( date +"%F %R" )
    load_5m=$( cat /proc/loadavg | { read first _; echo $first; } )
    if acpi -a | grep off-line > /dev/null; then
        battery=$( python -c "print(\"$(acpi)\".split(',')[1].strip())" )
        xsetroot -name "$battery"" | ""$load_5m"" | ""$datetime"
    else
        xsetroot -name "$load_5m"" | ""$datetime"
    fi
    sleep 5s
done &

exec dwm
