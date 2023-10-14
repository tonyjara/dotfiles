return {
	"windwp/nvim-ts-autotag",
	lazy = true,
	opts = function()
		local filetypes = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"xml",
			"php",
			"markdown",
			"astro",
			"glimmer",
			"handlebars",
			"hbs",
		}
		local skip_tags = {
			"area",
			"base",
			"br",
			"col",
			"command",
			"embed",
			"hr",
			"img",
			"slot",
			"input",
			"keygen",
			"link",
			"meta",
			"param",
			"source",
			"track",
			"wbr",
			"menuitem",
		}
		require("nvim-ts-autotag").setup({
			filetypes = filetypes,
			skip_tags = skip_tags,
		})
	end,
}
