return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#1a1b26",
			timeout = 1000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		})
		require("notify").history()
	end,
}
