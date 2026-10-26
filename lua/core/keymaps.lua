vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>w", function()
	vim.cmd("w")
end, { desc = "save file" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "escape terminal mode" })
vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, { desc = "rename  variable" })
vim.keymap.set("n", "<leader>tc", function () vim.cmd("silent! Themery") end , { desc = "change color scheme" })
vim.keymap.set("n", "<leader>cl", function()
	Snacks.picker.lsp_config()
end)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "go to reference" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "go to implementation" })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "go to type definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration" })
vim.keymap.set("n", "K", function()
	return vim.lsp.buf.hover()
end, { desc = "show doc for word under cusor" })
vim.keymap.set("n", "gK", function()
	return vim.lsp.buf.signature_help()
end, { desc = "show signature" })
vim.keymap.set("n", "<leader>cd", function ()
	vim.diagnostic.open_float(nil, {focus = true})
end, { desc = "go to declaration" })

vim.keymap.set("n", "<leader>fn", function ()
	vim.cmd("silent! tab new")
end, {desc = "new empty file"})

vim.keymap.set({"n", "v", "i"}, "<F1>", "")

vim.keymap.set("n", "<F1>", function ()
	local prefix = vim.fn.expand("%:e")
	if prefix == "c" or prefix == "h" then
		vim.cmd("Stdheader")
	else
		vim.cmd("help")
	end
end, {desc = "add the stdheader if in a c or h file else trigger the nvim help"})

vim.keymap.set("n", "<leader>bd", function () vim.cmd("bd") end, {desc = "delete current buffer"})
vim.keymap.set("n", "<leader>fe", function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local target_dir

  if buf_name == "" then
    target_dir = vim.fn.getcwd()
  else
    target_dir = vim.fs.dirname(buf_name)
  end
  vim.ui.input({ prompt = "New file: "}, function(input)
    if input and input ~= "" then
      vim.cmd("edit " .. target_dir .. "/" .. vim.fn.fnameescape(input))
    end
  end)
end, { desc = "Create file in current/root directory" })
