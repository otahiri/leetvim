vim.pack.add({
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons'},
	{ src = 'https://github.com/nvim-lualine/lualine.nvim'},
})


local function harpoon_status()
	local harpoon = require("harpoon")
	local list = harpoon:list()
	local length = list:length()
	if length == 0 then
		return ""
	end
	local current_file = vim.api.nvim_buf_get_name(0)
	local current_idx = "-"
	for i = 1 , length do
		local item = list:get(i)
		if item and item.value and item.value ~= "" then
			if string.sub(current_file, -string.len(item.value)) == item.value then
				current_idx = tostring(i)
				break
			end
		end
	end
	return string.format("⇁  %s/%d", current_idx, length)
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {harpoon_status, 'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
