local apps = require("key_applications")
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local plus = " + "

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local secondMod = "SHIFT"
local bothMods = mainMod .. plus .. secondMod


--=== Main Apps ===---
hl.bind(mainMod .. plus .. "T", hl.dsp.exec_cmd(apps.terminal))

hl.bind(mainMod .. plus .. "F", hl.dsp.exec_cmd(apps.fileManager))
hl.bind(bothMods .. plus .. "F", hl.dsp.exec_cmd(apps.tui_fileManager))

hl.bind(mainMod .. plus .. "R", hl.dsp.exec_cmd(apps.menu))
hl.bind(mainMod .. plus .. "B", hl.dsp.exec_cmd(apps.browser))

---=== Other Apps ==---
hl.bind(mainMod .. plus .. "M", hl.dsp.exec_cmd(apps.tui_mu))
hl.bind(bothMods .. plus .. "M", hl.dsp.exec_cmd(apps.mu))
hl.bind("ALT" .. plus .. "SPACE", hl.dsp.exec_cmd(apps.app_search))

local closeWindowBind = hl.bind(mainMod .. plus .. "Q", hl.dsp.window.close())


---=== Utility ===---
-- Single out a window (soft fullscreen)
hl.bind(secondMod .. plus .. "CTRL" .. plus .. "F", hl.dsp.window.fullscreen( { mode = 1 }))

-- Proper fullscreen
hl.bind(bothMods .. plus .. "CTRL" .. plus .. "F", hl.dsp.window.fullscreen())

-- Minimise
hl.bind(mainMod .. plus .. "X", function ()
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
    hl.dispatch(hl.dsp.window.move({workspace = "+0"}))
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
    hl.dispatch(hl.dsp.window.move({workspace = "special:minimize"}))
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
end)


---=== Screenshotting ===---
hl.bind(bothMods .. plus .. "S", hl.dsp.exec_cmd("slurp | grim -g - - | swappy -f -"))
hl.bind(bothMods .. plus .. "CTRL + S", hl.dsp.exec_cmd("slurp | grim -g - - | wl-copy"))

hl.bind(bothMods .. plus .. "SLASH", hl.dsp.exec_cmd("grim - | swappy -f -"))
hl.bind(bothMods .. plus .. "CTRL + SLASH", hl.dsp.exec_cmd("grim - | wl-copy"))


local hyprland_shutdown_cmd = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
hl.bind(bothMods .. " + Q", hl.dsp.exec_cmd(hyprland_shutdown_cmd))

hl.bind(mainMod .. plus .. "V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. plus .. "P", hl.dsp.window.pseudo())
hl.bind(mainMod .. plus .. "Z", hl.dsp.layout("togglesplit"))    -- dwindle only

-- move focus with mainMod + arrow keys
hl.bind(mainMod .. plus .. "H",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. plus .. "L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. plus .. "K",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. plus .. "J",  hl.dsp.focus({ direction = "down" }))

-- switch workspaces with mainMod + [0-9]
-- move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. plus .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. plus .. "SHIFT" .. plus .. key,     hl.dsp.window.move({ workspace = i }))
end

-- example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(bothMods,      hl.dsp.window.move({ workspace = "special:magic" }))

-- scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


hl.bind(mainMod .. plus .. secondMod .. plus .. "H", hl.dsp.layout("swapwithmaster ignoremaster"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Media
hl.bind("F7",  hl.dsp.exec_cmd("rmpc prev"),   { locked = true })
hl.bind("F8", hl.dsp.exec_cmd("rmpc togglepause"), { locked = true })
hl.bind("F9",  hl.dsp.exec_cmd("rmpc next"),       { locked = true })


