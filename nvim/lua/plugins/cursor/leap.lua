return {
	"ggandor/leap.nvim",
	config = function()
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		map("n", "s", "<Plug>(leap-forward-to)", opts)
		map("n", "S", "<Plug>(leap-backward-to)", opts)
		map("v", "s", "<Plug>(leap-forward-to)", opts)
		map("v", "S", "<Plug>(leap-backward-to)", opts)
	end,
}
