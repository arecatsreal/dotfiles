#Loading external objects
c.content.host_blocking.lists.append( str(config.configdir) + "/manualBlockList")
c.content.host_blocking.lists.append( str(config.configdir) + "/blockedHosts")
config.load_autoconfig()

#Harding Qutebrowser
config.set('content.javascript.enabled', False)
config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4209.0 Safari/537.36')
config.set('content.canvas_reading', False)
config.set('content.webgl', False)
config.set('content.headers.do_not_track', True)
config.set('content.webrtc_ip_handling_policy', 'default-public-interface-only')
config.set('content.geolocation', False)
config.set('content.private_browsing', True)
config.set('content.headers.referer', 'same-domain')
config.set('content.proxy', 'socks://localhost:9050/') # Use Tor

#Settings I like
config.bind('z', 'hint links spawn mpv --fs {hint-url}') # Opens mpv with the hinted url.
config.set("colors.webpage.darkmode.enabled", True) # Dark mode.
