gnome-terminal --hide-menubar \
               --tab-with-profile=Default \
               --tab-with-profile=Default \
               --tab-with-profile=Default \
               --tab-with-profile=Default &
firefox &
nautilus --no-desktop &
nm-applet &
trayer &
trayer --edge top --align right --widthtype request --distance 18 &
quodlibet &

xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Super_L"

synclient TapButton1=1
synclient ClickFinger2=2
syndaemon -dti 1

while true; do
   xsetroot -name "$( date +"%F %R" )"
   sleep 1m
done &

exec dwm
