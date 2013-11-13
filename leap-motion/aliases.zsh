function leap-up() {
    (sleep 1 && open /Applications/Leap\ Motion.app)&
    /Applications/Leap\ Motion.app/Contents/MacOS/leapd
}

function leap-down() {
    killall leapd
    killall Leap\ Motion
}
