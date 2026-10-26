vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function ()
		vim.keymap.set("n", "<CR>","<CR><cmd>cclose<CR>", {buffer = true, silent = true})
	end
})


vim.api.nvim_create_autocmd("FileType", {
	pattern = {"markdown", "md"},
	callback = function ()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
	end,
})

vim.api.nvim_create_autocmd('VimEnter', {
	callback = function(event)
	vim.defer_fn(function ()
		local buffer_name = vim.api.nvim_buf_get_name(0)
		if buffer_name == "" then
			local opts = {buffer = event.buf, silent = true, noremap = true}
			vim.keymap.set("n", "f", "<cmd>Telescope find_files<CR>", opts)
			vim.keymap.set("n", "o", "<cmd>Telescope oldfiles<CR>", opts)
			vim.keymap.set("n", "g", "<cmd>Telescope live_grep<CR>", opts)
			vim.keymap.set("n", "q",  "<cmd>qa<CR>", opts)
		end
	end, 20)
	end
})
