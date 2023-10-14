return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"lukas-reineke/lsp-format.nvim",
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		local protocol = require("vim.lsp.protocol")

		-- Set up completion using nvim_cmp with LSP source
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.completion.completionItem.resolveSupport = {
			properties = { "documentation", "detail", "additionalTextEdits" },
		}
		capabilities.textDocument.colorProvider = { dynamicRegistration = false }
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Function to check if a floating dialog exists and if not
		-- then check for diagnostics under the cursor
		function OpenDiagnosticIfNoFloat()
			for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
				if vim.api.nvim_win_get_config(winid).zindex then
					return
				end
			end
			-- THIS IS FOR BUILTIN LSP
			vim.diagnostic.open_float(0, {
				scope = "cursor",
				focusable = false,
				close_events = {
					"CursorMoved",
					"CursorMovedI",
					"BufHidden",
					"InsertCharPre",
					"WinLeave",
				},
			})
		end

		-- Show diagnostics under the cursor when holding position
		vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
		vim.api.nvim_create_autocmd({ "CursorHold" }, {
			pattern = "*",
			command = "lua OpenDiagnosticIfNoFloat()",
			group = "lsp_diagnostics_hold",
		})
		--Global keymaps
		vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, { desc = "Open diagnostics float" })
		vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
		vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open list of diagnostics" })

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		local on_attach = function(_, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			--Assigned in fold.lua
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
			--[[ vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts) ]]
			-- asssigned in code actions menu
			vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CodeActionMenu<cr>", bufopts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		end

		protocol.CompletionItemKind = {
			"", -- Text
			"", -- Method
			"", -- Function
			"", -- Constructor
			"", -- Field
			"", -- Variable
			"", -- Class
			"ﰮ", -- Interface
			"", -- Module
			"", -- Property
			"", -- Unit
			"", -- Value
			"", -- Enum
			"", -- Keyword
			"﬌", -- Snippet
			"", -- Color
			"", -- File
			"", -- Reference
			"", -- Folder
			"", -- EnumMember
			"", -- Constant
			"", -- Struct
			"", -- Event
			"ﬦ", -- Operator
			"", -- TypeParameter
		}

		nvim_lsp.eslint.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		nvim_lsp.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "python" },
		})

		nvim_lsp.tsserver.setup({
			on_attach = on_attach,
			filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
			cmd = { "typescript-language-server", "--stdio" },
			capabilities = capabilities,
		})

		--[[ require("typescript").setup({ ]]
		--[[ 	disable_commands = false, -- prevent the plugin from creating Vim commands ]]
		--[[ 	debug = false, -- enable debug logging for commands ]]
		--[[ 	go_to_source_definition = { ]]
		--[[ 		fallback = true, -- fall back to standard LSP definition on failure ]]
		--[[ 	}, ]]
		--[[]]
		--[[ 	filetypes = { "typescript", "typescriptreact", "typescript.tsx" }, ]]
		--[[ 	cmd = { "typescript-language-server", "--stdio" }, ]]
		--[[ 	capabilities = capabilities, ]]
		--[[ 	server = { -- pass options to lspconfig's setup method ]]
		--[[ 		on_attach = on_attach, ]]
		--[[ 	}, ]]
		--[[ }) ]]
		nvim_lsp.sourcekit.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		nvim_lsp.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},

					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			},
		})
		-- If not disabled it will popup as active even when not in use.
		nvim_lsp.tailwindcss.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
		})

		nvim_lsp.cssls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				-- This settings get rid of tailwind esling issues
				css = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				scss = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				less = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		})

		nvim_lsp.astro.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		nvim_lsp.prismals.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		nvim_lsp.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			signs = true,
			update_in_insert = true,
			virtual_text = { spacing = 4, prefix = "●" },
			severity_sort = true,
		})

		-- Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
			},
			underline = true,
			update_in_insert = true,
			float = {
				source = "always", -- Or "if_many"
			},
		})
	end,
}
