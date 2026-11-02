vim.pack.add({
	{src = "https://github.com/nvim-lua/plenary.nvim"},
	{src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2"}
})
local harpoon = require("harpoon")
local list = harpoon:list()

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
vim.keymap.set("n", "<leader>X", function() list:clear() end)
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

vim.keymap.set("n", "<leader>p", function() list:prev() end)
vim.keymap.set("n", "<leader>n", function() list:next() end)
