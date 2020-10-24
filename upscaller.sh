#PRIMARY DISPLAY = EXTENDED DISPLAY CONNECTED TO THE HDMI PORT
#SECONDARY DISPLAY = BUILT IN DISPLAY

PRIMARY_DISPLAY=$(xrandr | grep -w HDMI  | grep -w connected | awk -F'[ \+]' '{print $1; exit}')
SECONDARY_DISPLAY=$(xrandr | grep -w eDP  |  grep -w connected | awk -F'[ \+]' '{print $1; exit}')

MODE1408=$(cvt 1408 792 60 | sed -n '2p' | awk '{gsub(/Modeline /,"")}1')
MODE1440=$(cvt 1440 810 60 | sed -n '2p' | awk '{gsub(/Modeline /,"")}1')
MODE1536=$(cvt 1536 864 60 | sed -n '2p' | awk '{gsub(/Modeline /,"")}1')
MODE1600=$(cvt 1600 900 60 | sed -n '2p' | awk '{gsub(/Modeline /,"")}1')
MODE1920=$(cvt 1920 1080 60 | sed -n '2p' | awk '{gsub(/Modeline /,"")}1')

eval "xrandr --output ${SECONDARY_DISPLAY} --newmode ${MODE1408}"
eval "xrandr --addmode ${SECONDARY_DISPLAY} 1408x792_60.00"

eval "xrandr --output ${SECONDARY_DISPLAY} --newmode ${MODE1440}"
eval "xrandr --addmode ${SECONDARY_DISPLAY} 1440x810_60.00"

eval "xrandr --output ${SECONDARY_DISPLAY} --newmode ${MODE1536}"
eval "xrandr --addmode ${SECONDARY_DISPLAY} 1536x864_60.00"

eval "xrandr --output ${SECONDARY_DISPLAY} --newmode ${MODE1600}"
eval "xrandr --addmode ${SECONDARY_DISPLAY} 1600x900_60.00"

eval "xrandr --output ${SECONDARY_DISPLAY} --newmode ${MODE1920}"
eval "xrandr --addmode ${SECONDARY_DISPLAY} 1920x1080_60.00"

# SETTING THE EXTENDED DISPLAY AS PRIMARY, RIGHT OF THE IN BUILT DISPLAY
if [ "$PRIMARY_DISPLAY" != "" ]; then
	eval "xrandr --output ${PRIMARY_DISPLAY} --primary --right-of ${SECONDARY_DISPLAY}"
fi
