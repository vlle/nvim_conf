require("vlle")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if vim.lsp.inlay_hint then
	vim.lsp.inlay_hint.enable(true, { 0 })
end

-- Auto-install lazy.nvim if not present
if not vim.uv.fs_stat(lazypath) then
	print("Installing lazy.nvim....")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("vlle.lazy", opts)
-- vim.opt.expandtab = true
vim.opt.expandtab = false
vim.opt.tabstop = 2
-- vim.opt.background = "light"
vim.opt.shiftwidth = 4
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.smarttab = true
vim.opt.hlsearch = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ruler = true
vim.opt.visualbell = true
vim.opt.wildmenu = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
