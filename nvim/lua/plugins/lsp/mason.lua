return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					--[[ "tsserver", ]]
					"pyright",
					"lua_ls",
					"jsonls",
					"yamlls",
					--[[ "taplo", ]]
					"eslint",
					--[[ "omnisharp", ]]
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettierd",
					"black",
					--[[ "isort", ]]
					"cspell",
					"stylua",
					"mypy",
					"ruff",
					"debugpy",
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
}
