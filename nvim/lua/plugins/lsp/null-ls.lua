return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = "neovim/nvim-lspconfig",
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local lsp_formatting = function(buffer)
			vim.lsp.buf.format({
				filter = function(client)
					return client.name == "null-ls"
				end,
				bufnr = buffer,
			})
		end

		local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
		local event = "BufWritePre" -- or "BufWritePost"
		local async = event == "BufWritePost"

		null_ls.setup({
			sources = {
				require("typescript.extensions.null-ls.code-actions"),
				null_ls.builtins.formatting.stylua,
				-- Python
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.diagnostics.ruff,
				null_ls.builtins.formatting.black,

				--[[ null_ls.builtins.formatting.Prettier, ]]

				null_ls.builtins.formatting.eslint_d.with({
					filetypes = {
						"javascript",
						"typescript",
						"typescriptreact",
						"javascriptreact",
						"css",
						"scss",
						"html",
						"json",
						"yaml",
						"markdown",
						"graphql",
						"md",
						"txt",
					},
				}),

				null_ls.builtins.formatting.prettierd.with({
					filetypes = {
						"javascript",
						"typescript",
						"typescriptreact",
						"javascriptreact",
						"css",
						"scss",
						"html",
						"json",
						"yaml",
						"markdown",
						"graphql",
						"md",
						"txt",
					},
				}),
			},
			on_attach = function(client, bufnr)
				if not bufnr then
					return
				end

				if client.supports_method("textDocument/formatting") then
					vim.keymap.set("n", "<Leader>f", function()
						vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
					end, { buffer = bufnr, desc = "[lsp] format" })

					-- format on save
					vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
					vim.api.nvim_create_autocmd(event, {
						buffer = bufnr,
						group = group,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, async = async })
						end,
						desc = "[lsp] format on save",
					})
				end

				--[[ if client.supports_method("textDocument/rangeFormatting") then ]]
				--[[ 	vim.keymap.set("x", "<Leader>f", function() ]]
				--[[ 		vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() }) ]]
				--[[ 	end, { buffer = bufnr, desc = "[lsp] format" }) ]]
				--[[ end ]]
			end,
		})
	end,
}
