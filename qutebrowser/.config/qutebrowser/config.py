# Loading external objects
# c.content.host_blocking.lists.append( str(config.configdir) + "/manualBlockList")
# c.content.host_blocking.lists.append( str(config.configdir) + "/blockedHosts")
# config.load_autoconfig()

# Harding Qutebrowser
config.set("content.javascript.enabled", False)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.138Safari/537.36 AVG/112.0.21002.139",
)
config.set("content.canvas_reading", False)
config.set("content.webgl", False)
config.set("content.headers.do_not_track", True)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.geolocation", False)
config.set("content.private_browsing", True)
config.set("completion.cmd_history_max_items", 0)
config.set("content.cookies.store", False)
# config.set('content.cookies.accept', "never")
config.set("content.cookies.accept", "no-3rdparty")
config.set("content.headers.referer", "same-domain")

# Proxys
# config.set('content.proxy', 'socks://localhost:9050/') # Use Tor
# config.set('content.proxy', 'http://localhost:4444/') # Use I2p

# Settings I like
config.set("url.start_pages", "https://search.brave.com")
config.bind(
    "z", "hint links spawn mpv --fs {hint-url}"
)  # Opens mpv with the hinted url.
config.set("colors.webpage.preferred_color_scheme", "dark")  # Dark mode.
config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.darkmode.policy.images", "never")
config.set("qt.args", ["disable-remote-fonts"])
config.set("qt.highdpi", True)
config.bind("\\u", "hint links spawn -u untrack-url -O {hint-url}")
config.bind("\\U", "spawn -u untrack-url -p {clipboard}")
c.aliases = {"proxy": "spawn --userscript proxyswitch.sh"}
# Status Bars
config.set("statusbar.show", "never")
config.bind(
    "xx", "config-cycle statusbar.show always never"
)  # Hide and unhide the bottom bar.

# Yomichand
c.aliases = {"yomichan": "spawn --userscript yomichad"}
config.bind("gs", "spawn --userscript yomichad")
config.bind("gS", "spawn --userscript yomichad --prefix-search")
config.bind("gn", "spawn --userscript yomichad --names")

# Contaners
config.bind("C", "spawn --userscript container-open")
config.bind("<Alt-c>", "set-cmd-text -s :spawn --userscript container-open")
config.bind("<Alt-t>", "hint links userscript container-open")
config.bind("<Alt-t>", "hint links userscript container-open")
c.aliases["container-open"] = "spawn --userscript container-open"

# Colemak-DH
config.unbind("m")
config.unbind("n")
config.unbind("i")
config.unbind("j")
config.unbind("k")
config.unbind("l")
config.unbind("J")
config.unbind("K")
config.unbind("L")
config.unbind("f")
config.unbind("T")
config.unbind("z")
config.bind("m", "mode-enter insert")
config.bind("t", "hint")
config.bind("T", "hint all tab")
config.bind("n", "scroll down")
config.bind("e", "scroll up")
config.bind("i", "scroll right")
config.bind("N", "tab-next")
config.bind("E", "tab-prev")
config.bind("I", "forward")
config.bind("k", "search-next")
config.bind("K", "search-prev")
config.bind(
    "zzm", "config-cycle -p -t -u *://{url:host}/* content.javascript.enabled ;; reload"
)
config.set("hints.chars", "arstneio")

# Url-Mutator
# config.bind("t", "hint links spawn --userscript url_mutator /home/mip/.config/qutebrowser/url_mut_config.toml \"open\" {hint-url}")
# config.bind("T", "hint links spawn --userscript url_mutator /home/mip/.config/qutebrowser/url_mut_config.toml \"open -t\" {hint-url}")
config.bind(
    "l",
    'spawn --userscript url_mutator /home/mip/.config/qutebrowser/url_mut_config.toml "open" {clipboard}',
)
config.bind(
    "L",
    'spawn --userscript url_mutator /home/mip/.config/qutebrowser/url_mut_config.toml "open -t" {clipboard}',
)

#  Fonts
# config.set("fonts.default_family", "ComicCodeLigatures Nerd Font")
# config.set("fonts.default_size", "11pt")
# config.set("fonts.web.family.cursive", 'ComicCodeLigatures Nerd Font')
# config.set("fonts.web.family.fantasy", 'ComicCodeLigatures Nerd Font')
# config.set("fonts.web.family.fixed", 'ComicCodeLigatures Nerd Font')
# config.set("fonts.web.family.sans_serif", 'ComicCodeLigatures Nerd Font')
# config.set("fonts.web.family.serif", 'ComicCodeLigatures Nerd Font')
# config.set("fonts.web.family.standard", 'ComicCodeLigatures Nerd Font')
config.set("fonts.default_family", "VictorMono Nerd Font")
config.set("fonts.default_size", "11pt")
config.set("fonts.web.family.cursive", "VictorMono Nerd Font")
config.set("fonts.web.family.fantasy", "VictorMono Nerd Font")
config.set("fonts.web.family.fixed", "VictorMono Nerd Font")
config.set("fonts.web.family.sans_serif", "VictorMono Nerd Font")
config.set("fonts.web.family.serif", "VictorMono Nerd Font")
config.set("fonts.web.family.standard", "VictorMono Nerd Font")

# Javascipt Whitelist
config.set("content.javascript.enabled", True, "*://account.protonmail.com/*")
config.set("content.javascript.enabled", True, "*://mail.protonmail.com/*")
config.set("content.javascript.enabled", True, "*://*.proton.me/*")
config.set("content.javascript.enabled", True, "*://monkeytype.com/*")
config.set("content.javascript.enabled", True, "*://gitlab.com/*")
config.set("content.javascript.enabled", True, "*://github.com/*")
config.set("content.javascript.enabled", True, "*://startpage.com/*")
config.set("content.javascript.enabled", True, "*://anilist.co/*")
config.set("content.javascript.enabled", True, "*://parcelsapp.com/*")
config.set("content.javascript.enabled", True, "*://*.lan/*")
config.set("content.javascript.enabled", True, "*://mangadex.org/*")
config.set("content.javascript.enabled", True, "*://www.keybr.com/*")
config.set("content.javascript.enabled", True, "*://sourcegraph.com/*")
config.set("content.javascript.enabled", True, "*://biblioreads.ml/*")
config.set("content.javascript.enabled", True, "*://duckduckgo.com/*")
config.set("content.javascript.enabled", True, "*://10.0.0.1/*")

# Search Engines
search_engines = {
    "DEFAULT": "https://search.brave.com/search?q={}",
    "aw": "https://wiki.archlinux.org/index.php?title=Special:Search&search={}",
    "br": "https://search.brave.com/search?q={}",
    "chan": "https://www.4chan.org/{}",
    "dw": "https://wiki.debian.org/FrontPage?action=fullsearch&context=180&value={}&titlesearch=Titles",
    "eztv": "https://eztv.re/search/{}",
    "gh": "https://github.com/search?q={}",
    "gl": "https://gitlab.com/explore?utf8=%E2%9C%93&name={}&sort=latest_activity_desc",
    "geno": "http://gpo.zugaina.org/Search?search={}",
    "in": "https://yt.artemislena.eu/search?q={}",
    "j": "https://jisho.org/search?utf8=%E2%9C%93&keyword={}",
    "lu": "https://lutris.net/games?q={}",
    "ma": "https://mangadex.org/titles?q={}",
    "mw": "https://minecraft.fandom.com/wiki/{}",
    "pkg": "https://pkgs.org/search/?q={}",
    "po": "https://www.protondb.com/search?q={}",
    "tp": "https://parcelsapp.com/en/tracking/{}",
    "vn": "https://vndb.org/v?q={}&ch=&f=022gen164oand4odos4ops14opsp4opsv4ovnd&s=33w",
    "vndb": "https://vndb.org/v?sq={}",
    "ebay": "https://www.ebay.com/sch/i.html?_from=R40&_trksid=m570.l1313&_nkw={}&_sacat=0",
    "tu": "https://www.tumblr.com/search/{}",
    "sg": "https://sourcegraph.com/search?q=context%3Aglobal+{}&patternType=standard&sm=1&groupBy=repo",
    "rim": "https://steamcommunity.com/workshop/browse/?appid=294100&searchtext={}&childpublishedfileid=0&browsesort=textsearch&section=",
    "zom": "https://steamcommunity.com/workshop/browse/?appid=108600&searchtext={}&childpublishedfileid=0&browsesort=textsearch&section=",
    "dic": "https://en.wiktionary.org/w/index.php?fulltext=1&profile=default&search={}&title=Special%3ASearch&ns0=1",
    "bam": "https://www.booksamillion.com/search?query={}",
    "w": "https://www.wikipedia.org/w/index.php?title=Special:Search&search={}",
}
config.set("url.searchengines", search_engines)

# Zoom & Font size
config.set("zoom.default", 150)
config.set("fonts.default_size", "15pt")
# dot_file = open("/home/mip/.config/dot")
# dot = dot_file.read()
# dot_file.close()
# if dot.strip() == "main":
#     config.set("zoom.default", 150)
#     config.set("fonts.default_size", "15pt")
# elif dot.strip() == "thinkpad":
#     config.set("zoom.default", 100)
#     config.set("fonts.default_size", "8pt")

# Themeing
# import dracula.draw
# config.source("catppuccin.py")

# Load existing settings made via :set
config.load_autoconfig()

# Catppuccin
import catppuccin

catppuccin.setup(c, "mocha", True)

# Sites
# config.set('content.user.stylesheets', '$HOME/.config/qutebrowser/sytlesheets/catppuccin.css')

# dracula.draw.blood(c, {
#'spacing': {
#'vertical': 6,
#'horizontal': 8
# }
# })
