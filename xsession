# apps
nm-applet &
xss-lock slock &

# battery, loadavg, and clock
monitor &

# settings
xset b off
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Super_L"
synclient TapButton1=1 TapButton2=0 TapButton3=2 MaxDoubleTapTime=100 HorizTwoFingerScroll=1
syndaemon -dti 1

exec wm &> /tmp/penrose.log
