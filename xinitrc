if [ -f ~/.Xresources ]; then
	xrdb -merge ~/.Xresources
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Turn screen saver off and disable power saving mode
xset s off
xset -dpms


# Start powerline daemon
powerline-daemon

session=${1:-i3}

case $session in
	awesome) exec /usr/bin/awesome;;
	i3|i3wm) exec /usr/bin/i3;;
	xmonad) exec /usr/bin/xmonad;;
	lxde) exec /usr/bin/startlxde;;
	xfwm) exec /usr/bin/xfwm4;;
	xfce) exec /usr/bin/xfce4-session;;
esac
