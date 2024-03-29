local vscode = vim.g.vscode
if vscode then
	local map = vim.keymap.set

	--[[ vscode.action for asynchronous execution of actions. ]]
	--[[ vscode.call for synchronous execution of actions. ]]
	--[[ vscode.on for adding hook functions. ]]
	--[[ vscode.has_config check if a configuration exists ]]
	--[[ vscode.get_config get a configuration value ]]
	--[[ vscode.update_config update a configuration ]]
	--[[ vscode.notify like vim.notify, but use vscode notification to show the message ]]

	local vscode_neovim = require("vscode-neovim")

	map("n", "<leader>ff", function()
		vscode_neovim.notify("workbench.action.quickOpen")
	end)
	map("n", "∑", function()
		vscode_neovim.notify("workbench.action.closeActiveEditor")
	end)
	map("n", "<leader>ln", function()
		vscode_neovim.notify("editor.action.marker.nextInFiles")
	end)
	map("n", "<leader>lp", function()
		vscode_neovim.notify("editor.action.marker.prevInFiles")
	end)
	map("n", "<leader>bk", function()
		vscode_neovim.notify("workbench.action.closeAllEditors")
	end)
	map("n", "gcc", function()
		vscode_neovim.call("editor.action.commentLine")
	end)
	map("x", "gc", function()
		vscode_neovim.call("editor.action.commentLine")
		vim.api.nvim_input("<esc>")
	end)
	map({ "n", "x" }, "<leader>ca", function()
		vscode_neovim.notify("editor.action.quickFix")
	end)
	map("n", "<leader>cd", function()
		vscode_neovim.notify("editor.action.marker.next")
	end)
	map("n", "<leader>cf", function()
		vscode_neovim.call("editor.action.formatDocument")
	end)
	map("x", "<leader>cf", function()
		vscode_neovim.call("editor.action.formatSelection")
	end)
	map("n", "<leader>cr", function()
		vscode_neovim.call("editor.action.rename")
	end)
	map("n", "gd", function()
		vscode_neovim.notify("editor.action.revealDefinition")
	end)
	map("n", "gr", function()
		vscode_neovim.notify("editor.action.referenceSearch.trigger")
	end)
	map("n", "gD", function()
		vscode_neovim.notify("editor.action.revealDeclaration")
	end)
	map("n", "gI", function()
		vscode_neovim.notify("editor.action.goToImplementation")
	end)
	map("n", "gT", function()
		vscode_neovim.notify("editor.action.goToTypeDefinition")
	end)
	map("n", "K", function()
		vscode_neovim.notify("editor.action.showHover")
	end)
	map("n", "gK", function()
		vscode_neovim.notify("editor.action.triggerParameterHints")
	end)
	map("i", "<c-k>", function()
		vscode_neovim.notify("editor.action.triggerParameterHints")
	end)
end
