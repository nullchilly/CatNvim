if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx -- -ardelay 300 -arinterval 20 -dpi 133
fi
