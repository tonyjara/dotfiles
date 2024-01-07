return {
	"numToStr/Comment.nvim", -- Easily comment stuff
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" }, -- detect comment based on cursor
	config = function()
		local status_ok, comment = pcall(require, "Comment")
		if not status_ok then
			return
		end

		local vscode = vim.g.vscode
		if not vscode then
			comment.setup({
				pre_hook = function(ctx)
					local U = require("Comment.utils")

					local location = nil
					if ctx.ctype == U.ctype.block then
						location = require("ts_context_commentstring.utils").get_cursor_location()
					elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
						location = require("ts_context_commentstring.utils").get_visual_start_location()
					end

					return require("ts_context_commentstring.internal").calculate_commentstring({
						key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
						location = location,
					})
				end,
			})
		end
	end,
}
