vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Neotree)
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":quit!<CR>")
vim.keymap.set("n", "<leader>e", "::Neotree position=current<CR>", {})

function RevealFileInNeoTree()
	local file_path = vim.fn.expand("%:p")
	vim.cmd("Neotree reveal_file=" .. file_path)
end

vim.api.nvim_create_user_command("NeoTreeRevealFile", RevealFileInNeoTree, {})
vim.keymap.set("n", "<leader>r", ":NeoTreeRevealFile<CR>", {})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

vim.opt.clipboard = "unnamedplus"
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
-- vim.g.copilot_filetypes.markdown = true

-- convert to lua
-- let g:copilot_filetypes = {
--     \ 'gitcommit': v:true,
--     \ 'markdown': v:true,
--     \ 'yaml': v:true
--     \ }
vim.g.copilot_filetypes = {
	gitcommit = true,
	markdown = true,
	yaml = true,
}
