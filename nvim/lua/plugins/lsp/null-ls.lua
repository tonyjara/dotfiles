return {
	"jose-elias-alvarez/null-ls.nvim",

	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	opts = function()
		local null_ls = require("null-ls")

		local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
		local event = "BufWritePre" -- or "BufWritePost"
		local async = event == "BufWritePost"

		---@diagnostic disable-next-line: redundant-parameter
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- Python
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.diagnostics.ruff,
				null_ls.builtins.formatting.black,

				null_ls.builtins.formatting.Prettier,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
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
			end,
		})
	end,
}
