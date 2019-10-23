import time

terminal = "urxvt"

# Look
# qutebrowser 1.50 required
c.tabs.max_width = 300
c.tabs.title.format_pinned = "{index}: {host} [P]"
c.tabs.padding = {"top": 5, "bottom": 5, "left": 5, "right": 5}
c.colors.tabs.even.bg = "#888888"
c.colors.tabs.odd.bg = "#777777"
c.colors.tabs.selected.odd.bg = "#5555FF"
c.colors.tabs.selected.even.bg = "#5555FF"

# Pinned tab colors
#  c.colors.tabs.pinned.odd.bg = "#66cc99"
#  c.colors.tabs.pinned.even.bg = "#26c281"
#  c.colors.tabs.pinned.selected.odd.bg = "#4d05e8"
#  c.colors.tabs.pinned.selected.even.bg = "#4d05e8"

#  c.colors.tabs.pinned.odd.fg = "#AAAAAA"
#  c.colors.tabs.pinned.even.fg = "#AAAAAA"
#  c.colors.tabs.pinned.selected.odd.fg = "#AAAAAA"
#  c.colors.tabs.pinned.selected.even.fg = "#AAAAAA"



# Whitelist
c.content.host_blocking.whitelist.append("https://thepiratebay.org")
c.content.host_blocking.whitelist.append("https://1337x.to")
c.content.host_blocking.whitelist.append("0.0.0.0")


# Vim as editor
c.editor.command = [terminal, "-e", "vim", "{file}"]


# Start default and start pages
c.url.default_page = "about:blank"
c.url.start_pages = ["https://stackoverflow.com"]



# Set search engines
c.url.searchengines = {
	"DEFAULT": "https://google.com/search?q={}",
	"a": "https://wiki.archlinux.org/?search={}",
	"d": "https://duckduckgo.com/?q={}&ia=web",
	"r": "https://reddit.com/r/{}",
	"w": "https://en.wikipedia.org/w/index.php?search={}&title=Special:Search",
	"y": "https://youtube.com/results?search_query={}",
	"s": "https://stackoverflow.com/search?q={}",
	"g": "https://github.com/search?q={}",
}


# Keybindings
leader = ","

keybindings = {
	("e", "e"): "open-editor",
	("e", "o"): "edit-url",
	(leader, "v", "t"): "open https://vim.fandom.com/wiki/Special:Random",
	("p", "s"): "hink links spawn pockyt put -i {hint-url}",
}

for keys, command in keybindings.items():
	config.bind("".join(keys), command)

c.input.insert_mode.auto_enter = True
