local applications = {}

applications.terminal    = "kitty"

applications.fileManager = "dolphin"
applications.tui_fileManager = applications.terminal .. " yazi"

applications.mu          = "spotify-launcher"
applications.tui_mu      = applications.terminal .. " rmpc"
applications.menu        = "hyprlauncher"
applications.browser     = "firefox"
applications.app_search  = "rofi -show run"

return applications
