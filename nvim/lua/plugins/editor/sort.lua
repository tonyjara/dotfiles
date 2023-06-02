return {
	"sQVe/sort.nvim",
    opts = function()
require("sort").setup({
	delimiters = {
		",",
		"|",
		";",
		":",
		"s", -- Space
		"t", -- Tab
	},
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("v", "<leader>cs", "<cmd>Sort<CR>", opts)
    end
}
