# apps
gnome-terminal --hide-menubar \
               --tab-with-profile=Default \
               --tab-with-profile=Default \
               --tab-with-profile=Default \
               --tab-with-profile=Default &
firefox &
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
   xsetroot -name "$( date +"%F %R" )"
   sleep 1m
done &

exec dwm
