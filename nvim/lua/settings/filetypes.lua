vim.filetype.add({
	extension = {
		mdx = "mdx",
		astro = "astro",
		--[[ env = "dotenv", ]]
	},
	filename = {
		--[[ [".env"] = "dotenv", ]]
		["tsconfig.json"] = "jsonc",
		[".yamlfmt"] = "yaml",
	},
	pattern = {
		--[[ ["%.env%.[%w_.-]+"] = "dotenv", ]]
	},
})
