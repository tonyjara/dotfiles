return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local status, nvim_lsp = pcall(require, "lspconfig")
		if not status then
			return
		end

		local protocol = require("vim.lsp.protocol")

		-- Set up completion using nvim_cmp with LSP source
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.completion.completionItem.resolveSupport = {
			properties = { "documentation", "detail", "additionalTextEdits" },
		}
		capabilities.textDocument.colorProvider = { dynamicRegistration = false }
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

		local enable_format_on_save = function(_, bufnr)
			vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup_format,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end

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
			--[[ vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts) ]]
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
			filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
			cmd = { "typescript-language-server", "--stdio" },
			capabilities = capabilities,
		})
		--[[]]
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
		--[[ 	on_attach = on_attach, ]]
		--[[ 	}, ]]
		--[[ }) ]]

		nvim_lsp.sourcekit.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		nvim_lsp.lua_ls.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
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
			update_in_insert = false,
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
			update_in_insert = true,
			float = {
				source = "always", -- Or "if_many"
			},
		})
	end,
}
