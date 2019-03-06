# apps
firefox &
nm-applet &
trayer --edge top --align right --widthtype request --distance 19 &
xfce4-terminal --hide-menubar --tab --tab &
cd ~/hotrod/docs/ops; and mdbook serve --port 4000 --websocket-port 4001 &
cd ~/hotrod/docs/dev; and mdbook serve --port 5000 --websocket-port 5001 &
pulseaudio &
nautilus --no-desktop &
xss-lock slock &
quodlibet &
# I want liferea to open last (on its workspace) so it gets a bigger Window
liferea &

# settings
xset b off
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Super_L"

synclient TapButton1=1 TapButton2=3 TapButton3=2 MaxDoubleTapTime=100 HorizTwoFingerScroll=1
syndaemon -dti 1

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
