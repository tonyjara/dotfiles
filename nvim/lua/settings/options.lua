vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
--[[ vim.opt.guicursor = "" ]]
-- Fix slow exit times?
--[[ vim.opt.fsync = false ]]

vim.opt.rnu = true
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.mousescroll = { "ver:1", "hor:6" }

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 1
vim.opt.mousemodel = "popup"

vim.opt.fo:remove("c") -- Dont comment new lines after commented line
vim.opt.fo:remove("r") -- Dont comment new lines after commented line
vim.opt.fo:remove({ "o" }) -- Dont comment new lines after commented line

vim.diagnostic.config({
	update_in_insert = true,
})

vim.opt.spelllang = "en_us,es"
--[[ vim.opt.spell = true ]]
