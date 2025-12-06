-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night'
config.font = wezterm.font 'CaskaydiaCove Nerd Font Mono'
config.font_size = 14.0
config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.default_prog = { 'tmux', 'new', '-As0' }
-- config.window_decorations = "RESIZE"
config.hide_mouse_cursor_when_typing = false

config.colors = {
    background = '#011627'
}


-- and finally, return the configuration to wezterm
return config
