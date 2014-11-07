# apps
xfce4-terminal --hide-menubar --tab --tab --tab &
firefox &
thunar --no-desktop &
nm-applet &
emacs --daemon
trayer --edge top --align right --widthtype request --distance 15 &
if [ $HOSTNAME == 'twork' ]; then
   icedove &
else
    quodlibet &
    liferea &
fi

# settings
xset b off
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Super_L"

# host-specific settings
if [ $HOSTNAME == 'twork' ]; then
    xrandr --output VGA-0 --output DVI-0 --right-of VGA-0
else
    synclient TapButton1=1 TapButton2=3 TapButton3=2 MaxDoubleTapTime=100
    syndaemon -dti 1
fi

# clock
while true; do
    datetime=$( date +"%F %R" )
    if acpi -a | grep off-line > /dev/null; then
        battery=$( python -c "print(\"$(acpi)\".split(',')[1].strip())" )
        xsetroot -name "$battery"" | ""$datetime"
    else
        xsetroot -name "$datetime"
    fi
    sleep 1m
done &

exec dwm
