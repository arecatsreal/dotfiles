#Sets the paths.
PATH=${PATH}:/home/$USER/.scrips/:/home/$USER/.local/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/bedrock/bin/:/home/$USER/mip/go/src/bin
PATH=${PATH}:$(find ~/.scrips -type d | tr '\n' ':' | sed 's/:$//') # Makes the path recursive on .scrips dir.

#Props the use if they want to startx.
startx_prompt.sh

if [ $TERM == linux ]; then
	mpd
fi
