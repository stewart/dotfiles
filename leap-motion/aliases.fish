function leap_up
  open /Applications/Leap\ Motion.app
  /Applications/Leap\ Motion.app/Contents/MacOS/leapd
end

function leap_down
  killall leapd
  killall "Leap Motion"
end
