# apps
xfce4-terminal --hide-menubar \
               --tab --tab --tab &
iceweasel &
nautilus --no-desktop &
nm-applet &
trayer --edge top --align right --widthtype request --distance 18 &
quodlibet &
if [ $HOSTNAME == 'twork' ]; then
   icedove &
fi

# settings
xset b off
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Super_L"

# host-specific settings
if [ $HOSTNAME == 'twork' ]; then
    xrandr --output VGA-0 --output DVI-0 --right-of VGA-0
else
    synclient TapButton1=1
    synclient ClickFinger2=2
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
