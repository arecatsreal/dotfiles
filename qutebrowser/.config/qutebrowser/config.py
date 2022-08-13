# Loading external objects
#c.content.host_blocking.lists.append( str(config.configdir) + "/manualBlockList")
#c.content.host_blocking.lists.append( str(config.configdir) + "/blockedHosts")
config.load_autoconfig()

# Harding Qutebrowser
config.set('content.javascript.enabled', False)
config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36')
config.set('content.canvas_reading', False)
config.set('content.webgl', False)
config.set('content.headers.do_not_track', True)
config.set('content.webrtc_ip_handling_policy', 'default-public-interface-only')
config.set('content.geolocation', False)
config.set('content.private_browsing', True)
config.set('completion.cmd_history_max_items', 0)
config.set('content.cookies.store', False)
#config.set('content.cookies.accept', "never")
config.set('content.headers.referer', 'same-domain')

# Proxys
#config.set('content.proxy', 'socks://localhost:9050/') # Use Tor
#config.set('content.proxy', 'http://localhost:4444/') # Use I2p

# Settings I like
config.bind('z', 'hint links spawn mpv --fs {hint-url}') # Opens mpv with the hinted url.
config.set("colors.webpage.preferred_color_scheme", "dark") # Dark mode.
config.set("colors.webpage.darkmode.policy.images", "never")
#config.set('qt.args', ['disable-remote-fonts'])
config.bind('xx', 'config-cycle statusbar.show always never') # Hide and unhide the bottom bar.
config.bind('\\u', 'hint links spawn -u untrack-url -O {hint-url}')
config.bind('\\U', 'spawn -u untrack-url -p {clipboard}')
c.aliases = {
    "proxy": "spawn --userscript proxyswitch.sh"
}

#Colemak-DH
config.unbind('m')
config.unbind('n')
config.unbind('i')
config.unbind('j')
config.unbind('k')
config.unbind('l')
config.unbind('J')
config.unbind('K')
config.unbind('L')
config.unbind('f')
config.unbind('T')
config.unbind('z')
config.bind('m', 'mode-enter insert')
config.bind('t', 'hint')
config.bind('T', 'hint all tab')
config.bind('n', 'scroll down')
config.bind('e', 'scroll up')
config.bind('i', 'scroll right')
config.bind('N', 'tab-next')
config.bind('E', 'tab-prev')
config.bind('I', 'forward')
config.bind('k', 'search-next')
config.bind('K', 'search-prev')
config.bind('zzm', 'config-cycle -p -t -u *://{url:host}/* content.javascript.enabled ;; reload')
config.set('hints.chars', 'arstneio')

#  Fonts
#config.set("fonts.default_family", "ComicCodeLigatures Nerd Font")
#config.set("fonts.default_size", "11pt")
#config.set("fonts.web.family.cursive", 'ComicCodeLigatures Nerd Font')
#config.set("fonts.web.family.fantasy", 'ComicCodeLigatures Nerd Font')
#config.set("fonts.web.family.fixed", 'ComicCodeLigatures Nerd Font')
#config.set("fonts.web.family.sans_serif", 'ComicCodeLigatures Nerd Font')
#config.set("fonts.web.family.serif", 'ComicCodeLigatures Nerd Font')
#config.set("fonts.web.family.standard", 'ComicCodeLigatures Nerd Font')
config.set("fonts.default_family", "VictorMono Nerd Font")
config.set("fonts.default_size", "11pt")
config.set("fonts.web.family.cursive", 'VictorMono Nerd Font')
config.set("fonts.web.family.fantasy", 'VictorMono Nerd Font')
config.set("fonts.web.family.fixed", 'VictorMono Nerd Font')
config.set("fonts.web.family.sans_serif", 'VictorMono Nerd Font')
config.set("fonts.web.family.serif", 'VictorMono Nerd Font')
config.set("fonts.web.family.standard", 'VictorMono Nerd Font')

# Javascipt Whitelist
config.set("content.javascript.enabled", True, '*://account.protonmail.com/*')
config.set("content.javascript.enabled", True, '*://mail.protonmail.com/*')
config.set("content.javascript.enabled", True, '*://monkeytype.com/*')
config.set("content.javascript.enabled", True, '*://gitlab.com/*')
config.set("content.javascript.enabled", True, '*://startpage.com/*')
config.set("content.javascript.enabled", True, '*://anilist.co/*')
config.set("content.javascript.enabled", True, '*://parcelsapp.com/*')
config.set("content.javascript.enabled", True, '*://*.lan/*')
config.set("content.javascript.enabled", True, '*://mangadex.org/*')
config.set("content.javascript.enabled", True, '*://www.keybr.com/*')

# Zoom & Font size 
dot_file = open("/home/mip/.config/dot")
dot = dot_file.read()
dot_file.close()
if dot.strip() == 'main':
    config.set("zoom.default", 150)
    config.set("fonts.default_size", '15pt')
elif dot.strip() == 'thinkpad':
    config.set("zoom.default", 100)
    config.set("fonts.default_size", '8pt')

# Themeing
#import dracula.draw
config.source('nord-qutebrowser.py')

# Load existing settings made via :set
config.load_autoconfig()

# Sites
#config.set('content.user.stylesheets', '$HOME/.config/qutebrowser/sytlesheets/catppuccin.css')

#dracula.draw.blood(c, {
    #'spacing': {
        #'vertical': 6,
        #'horizontal': 8
    #}
#})
