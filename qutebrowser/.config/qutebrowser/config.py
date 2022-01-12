# Loading external objects
#c.content.host_blocking.lists.append( str(config.configdir) + "/manualBlockList")
#c.content.host_blocking.lists.append( str(config.configdir) + "/blockedHosts")
config.load_autoconfig()

# Harding Qutebrowser
config.set('content.javascript.enabled', False)
config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36')
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
config.bind('xx', 'config-cycle statusbar.show always never') # Hide and unhide the bottom bar.

config.bind('\\u', 'hint links spawn -u untrack-url -O {hint-url}')
config.bind('\\U', 'spawn -u untrack-url -p {clipboard}')
c.aliases = {
    "proxy": "spawn --userscript proxyswitch.sh"
}

# Javascipt Whitelist
config.set("content.javascript.enabled", True, '*://account.protonmail.com/*')
config.set("content.javascript.enabled", True, '*://mail.protonmail.com/*')
config.set("content.javascript.enabled", True, '*://monkeytype.com/*')
config.set("content.javascript.enabled", True, '*://gitlab.com/*')
config.set("content.javascript.enabled", True, '*://startpage.com/*')
config.set("content.javascript.enabled", True, '*://anilist.co/*')
config.set("content.javascript.enabled", True, '*://parcelsapp.com/*')
config.set("content.javascript.enabled", True, '*://*.lan/*')

# Zoom & Font size 
dot_file = open("/home/mip/.config/dot")
dot = dot_file.read()
dot_file.close()
if dot.strip() == 'main':
    config.set("zoom.default", 150)
elif dot.strip() == 'thinkpad':
    config.set("zoom.default", 100)
    config.set("fonts.default_size", '8pt')

# Themeing
import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})
