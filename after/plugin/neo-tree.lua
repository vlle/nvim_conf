require("neo-tree").setup({
	use_libuv_file_watcher = true,
	follow_current_file = {
		enabled = true,
		leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
	},
	vim.cmd([[nnoremap \ :Neotree reveal<cr>]]),
})
