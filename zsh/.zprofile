#Sets the paths.
PATH=/home/$USER/.scrips/:/home/$USER/.local/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/bedrock/bin/:/home/$USER/go/src/bin:/home/$USER/sync/bin:/home/$USER/.cargo/bin:/home/$USER/games/bin:$PATH
PATH=${PATH}:$(find ~/.scrips -type d | tr '\n' ':' | sed 's/:$//') # Makes the path recursive on .scrips dir.

#Props the use if they want to startx.
XRUN=false
pgrep X 2> /dev/null > /dev/null && XRUN=true
if [ !$XRUN ]; then
	startx_prompt.sh
fi
