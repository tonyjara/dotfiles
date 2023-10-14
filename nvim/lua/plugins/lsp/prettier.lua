return {
	"MunifTanjim/prettier.nvim",
	opts = function()
		local prettier = require("prettier")

		prettier.setup({
			bin = "prettier", -- or `'prettierd'` (v0.22+)
			filetypes = {
				"css",
				"graphql",
				"html",
				"javascript",
				"javascriptreact",
				"astro",
				"json",
				"less",
				"markdown",
				"scss",
				"typescript",
				"typescriptreact",
				"yaml",
			},
		})
	end,
}
