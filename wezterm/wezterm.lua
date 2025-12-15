-- Pull in the wezterm API
local wezterm = require("wezterm")
local workspace_management = require("workspace_management")
local utils = require("utils")
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 14
config.font = wezterm.font("HackGen35 Console NF", { weight = "Regular", stretch = "Normal", italic = false })
config.color_scheme = "Tokyo Night"

-- background transparency
config.window_background_opacity = 1.0

-- remove title bar
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
	font_size = 16.0,
}
config.tab_max_width = 32

-- Fullscreen
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	local screen = window:gui_window():get_screen()
	local screen_size = screen:get_dimensions()
	-- window:gui_window():set_inner_size(screen_size.cols, screen_size.rows)
end)

-- -- 2. ステータスバーの右側にワークスペース名を表示するイベント設定
-- wezterm.on("update-right-status", function(window, pane)
-- 	-- 現在のワークスペース名を取得
-- 	local workspace = window:active_workspace()
--
-- 	-- 表示内容のフォーマット（色やテキスト）
-- 	window:set_right_status(wezterm.format({
-- 		-- 色の設定（例: 水色）
-- 		{ Foreground = { Color = "#88c0d0" } },
-- 		-- 太字にする
-- 		{ Attribute = { Intensity = "Bold" } },
-- 		-- 表示テキスト（アイコンや空白はお好みで調整してください）
-- 		{ Text = "  :" .. workspace .. "  " },
-- 	}))
-- end)
--
-- off system bell
config.audible_bell = "Disabled"

config.keys = {
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "{",
		mods = "CMD",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "}",
		mods = "CMD",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "n",
		mods = "CMD",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for workspace",
			action = wezterm.action_callback(workspace_management.create_or_switch_new),
		}),
	},
	{
		mods = "CMD",
		key = "s",
		action = wezterm.action_callback(workspace_management.switch_to_workspace),
	},
}

-- Finally, return the configuration to wezterm:
return config
