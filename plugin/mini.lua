vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.nvim', version = 'stable' },
})

require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.jump').setup( )
require("mini.jump2d").setup()
