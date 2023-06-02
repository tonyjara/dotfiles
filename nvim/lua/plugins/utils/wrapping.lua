return {
	"andrewferrier/wrapping.nvim",
	opts = function()
		local x = {
			auto_set_mode_filetype_allowlist = {
				"asciidoc",
				"gitcommit",
				"latex",
				"mail",
				"markdown",
				"rst",
				"tex",
				"text",
			},
		}
		-- Wraps text, breaks lines
		require("wrapping").setup(x)
	end,
}
