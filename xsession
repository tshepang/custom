# apps
xfce4-terminal --hide-menubar --tab --tab &
firefox &
nautilus --no-desktop &
nm-applet &
trayer --edge top --align right --widthtype request --distance 15 &
xss-lock slock &
quodlibet &
sleep 2  # I want liferea to open last so it gets a bigger Window
liferea &
# I place this here to make sure the terminal is fully open first
RUST_SRC_PATH=~/rust/src emacs --daemon

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
    if acpi -a | grep off-line > /dev/null; then
        battery=$( python -c "print(\"$(acpi)\".split(',')[1].strip())" )
        xsetroot -name "$battery"" | ""$datetime"
    else
        xsetroot -name "$datetime"
    fi
    sleep 1m
done &

exec dwm
