# Loading external objects
#c.content.host_blocking.lists.append( str(config.configdir) + "/manualBlockList")
#c.content.host_blocking.lists.append( str(config.configdir) + "/blockedHosts")
config.load_autoconfig()

# Harding Qutebrowser
config.set('content.javascript.enabled', False)
config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101 Firefox/78.0')
config.set('content.canvas_reading', False)
config.set('content.webgl', False)
config.set('content.headers.do_not_track', True)
config.set('content.webrtc_ip_handling_policy', 'default-public-interface-only')
config.set('content.geolocation', False)
config.set('content.private_browsing', True)
config.set('content.cookies.store', False)
config.set('content.headers.referer', 'same-domain')

# Proxys
config.set('content.proxy', 'socks://localhost:9050/') # Use Tor
#config.set('content.proxy', 'http://localhost:4444/') # Use I2p

# Settings I like
config.bind('z', 'hint links spawn mpv --fs {hint-url}') # Opens mpv with the hinted url.
config.set("colors.webpage.preferred_color_scheme", "dark") # Dark mode.
config.bind('xx', 'config-cycle statusbar.show always never') # Hide and unhide the bottom bar.

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
