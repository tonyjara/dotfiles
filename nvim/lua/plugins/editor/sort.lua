return {
	"sQVe/sort.nvim",
	config = function()
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
		map("v", "<leader>cs", "<cmd>Sort<CR>", { noremap = true, silent = true, desc = "Sort selection" })
	end,
}
