local programs = {}

-- programs.terminal = "footclient"
programs.terminal = "/home/negc/.local/bin/kitty" -- CRT Kitty 0.51 (Catppuccin + crt-retro)
programs.fileManager = "footclient yazi"
programs.menu = "/home/negc/.local/bin/smart_menu.sh"
programs.restartBar = "/home/negc/.local/bin/restart_quickshell.sh"
programs.bar = "quickshell"
programs.controlCenter = "/home/negc/.local/bin/smart_controlcenter.sh"
programs.rog = "rog-control-center"
programs.screenshot = 'grim -g "$(slurp)" - | wl-copy'
programs.browser = "firefox"
programs.powermenu = "/home/negc/.local/bin/smart_powermenu.sh"
programs.lock = "hyprlock"
programs.note = "nvim"
programs.dock = ""

return programs
