return {
	"HiPhish/rainbow-delimiters.nvim",
	event = "VeryLazy",
	config = function()
		local rainbow_delimiters = require("rainbow-delimiters")

		-- rainbow-parens only colorize parens and brackets
		-- rainbow-blocks for start and end languages
		-- rainbow-delimiters-react for jsx

		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				commonlisp = rainbow_delimiters.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
				html = "rainbow-tags",
				javascript = "rainbow-parens",
				tsx = "rainbow-parens",
			},
			highlight = {
				"RainbowDelimiterOrange",
				"RainbowDelimiterYellow",
				"RainbowDelimiterViolet",
				"RainbowDelimiterGreen",
				"RainbowDelimiterCyan",
				"RainbowDelimiterBlue",
				"RainbowDelimiterRed",
			},
			blacklist = { "c", "cpp" },
		}
	end,
}
