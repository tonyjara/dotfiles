return {
	"hrsh7th/nvim-cmp",
	--[[ version = false, -- last release is way too old ]]
	event = { "BufRead", "BufNewFile", "InsertEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"github/copilot.vim",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind-nvim", -- Vscode like pictograms
	},

	opts = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		---@diagnostic disable-next-line: redundant-parameter
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
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
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},
			sources = {
				-- ORDER MATTERS HERE
				-- Other options are keyword_length and priority, length is to specify when com should begin
				{ name = "nvim_lua", max_item_count = 5 },
				{ name = "nvim_lsp", max_item_count = 10 },
				{ name = "luasnip", max_item_count = 5 },
				{ name = "buffer", max_item_count = 10 },
				{ name = "path", max_item_count = 5 },
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			window = {
				documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = false,
				native_menu = false,
			},
		})

		vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
	end,
}
