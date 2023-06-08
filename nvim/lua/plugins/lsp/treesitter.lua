return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "windwp/nvim-ts-autotag" },
	opts = {
		-- A list of parser names, or "all" (the four listed parsers should always be installed)
		ensure_installed = {
			"help",
			"javascript",
			"typescript",
			"tsx",
			"json",
			"yaml",
			"c",
			"lua",
			"vim",
			"help",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"prisma",
			"python",
			-- These don't work
			--[[ "pyright", ]]
			--[[ "mypy", ]]
			--[[ "ruff", ]]
			--[[ "black", ]]
		},
		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = true,
		autotag = {
			enable = true,
		},
		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,
		autopairs = {
			enable = true,
		},
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = {}, -- list of language that will be disabled
			additional_vim_regex_highlighting = true,
		},
		indent = {
			enable = true,
			--[[ disable = { "yaml" } ]]
		},
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
		rainbow = {
			enable = true,
			-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
			extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			max_file_lines = nil, -- Do not enable for files with more than n lines, int
			-- colors = {}, -- table of hex strings
			query = "rainbow-parens", -- Highlight the entire buffer all at once
			--[[ strategy = require("ts-rainbow").strategy.global, ]]
		},
		-- termcolors = {} -- table of colour name strings
	},
	config = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			---@type table<string, boolean>
			local added = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if added[lang] then
					return false
				end
				added[lang] = true
				return true
			end, opts.ensure_installed)
		end
		require("nvim-treesitter.configs").setup(opts)
	end,
}
