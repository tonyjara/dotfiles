return {
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	},
	{
		"hrsh7th/nvim-cmp",
		-- don't know if I need these
		--[[ event = { "BufRead", "BufNewFile", "InsertEnter" }, ]]
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",

			-- Vscode like pictograms
			"onsails/lspkind-nvim",

			--Snippets
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},

			-- Copilot
			"github/copilot.vim",
		},
		config = function()
			local lspkind = require("lspkind")
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				performance = {
					max_view_entries = 100,
				},
				sources = {
					-- ORDER MATTERS HERE
					-- Other options are keyword_length and priority, length is to specify when cmp should begin
					{ name = "luasnip", max_item_count = 2 },
					{ name = "nvim_lua", max_item_count = 5 },
					{ name = "nvim_lsp", max_item_count = 5 },
					{ name = "buffer", max_item_count = 5 },
					{ name = "path", max_item_count = 5 },
					--[[ { name = "cmp_luasnip", max_item_count = 2 ]]
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},

				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						menu = {
							buffer = "[buf]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[api]",
							path = "[path]",
							luasnip = "[snip]",
						},
					}),
				},

				window = {
					documentation = cmp.config.window.bordered(),
				},
				experimental = {
					ghost_text = false,
					native_menu = false,
				},
			})
		end,
	},
}
