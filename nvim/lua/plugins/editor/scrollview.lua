return {
	"dstein64/nvim-scrollview",
	opts = function()
		require("scrollview").setup({
			excluded_filetypes = { "nerdtree" },
			current_only = true,
			winblend = 75,
			base = "buffer",
			column = 80,
		})
	end,
}
