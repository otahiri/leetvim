vim.pack.add({
	{src = "https://github.com/nvim-lua/plenary.nvim"},
	{src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2"}
})
local harpoon = require("harpoon")
local list = harpoon:list()
local function get_current_buf_idx()
	local current_buffer = vim.api.nvim_buf_get_name(0)
	for i, item in ipairs(list.items) do
		if item and item.value and item.value ~= "" then
			if string.sub(current_buffer, -string.len(item.value)) == item.value then
				return i
			end
		end
	end
	return 1
end

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	local count = list:length()
	if count > 9 then
		vim.notify("harpoon buffers exceed 10\n to navigate the other buffers you must use\n space n(next) and space p(previous) for additional buffers")
	end
	list:add()
end
)
vim.keymap.set("n", "<leader>x", function() list:remove() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(list) end)

vim.keymap.set("n", "<leader>1", function() list:select(1) end)
vim.keymap.set("n", "<leader>2", function() list:select(2) end)
vim.keymap.set("n", "<leader>3", function() list:select(3) end)
vim.keymap.set("n", "<leader>4", function() list:select(4) end)
vim.keymap.set("n", "<leader>5", function() list:select(5) end)
vim.keymap.set("n", "<leader>6", function() list:select(6) end)
vim.keymap.set("n", "<leader>7", function() list:select(7) end)
vim.keymap.set("n", "<leader>8", function() list:select(8) end)
vim.keymap.set("n", "<leader>9", function() list:select(9) end)

vim.keymap.set("n", "<leader>p", function()
	local current = get_current_buf_idx()
	local len = list:length()
	if len == 0 then return end
	if current == 1 then
		list:select(list:length())
	else
		list:prev()
	end
end)
vim.keymap.set("n", "<leader>n", function()
	local len = list:length()
	if len == 0 then return end
	local current = get_current_buf_idx()
	if current == len then
		list:select(1)
	else
		list:next()
	end

end)
