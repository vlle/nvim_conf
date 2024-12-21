local lsp_zero = require("lsp-zero")

local lsp_attach = function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
	vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	vim.keymap.set(
		"n", -- Normal mode
		"gl", -- Keybind (you can change 'g-l' to whatever you prefer)
		"<cmd>lua vim.diagnostic.open_float()<CR>" -- Command to show diagnostics
	)
end

-- Keybind for showing error text in a floating window

lsp_zero.extend_lspconfig({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	lsp_attach = lsp_attach,
	float_border = "rounded",
	sign_text = {
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "»",
	},
})

local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"gopls",
		"vacuum",
	},
	inlay_hints = {
		enabled = true,
	},
	handlers = {
		-- lsp_zero.default_setup,
		gopls = function()
			require("lspconfig").gopls.setup({
				on_attach = function(client, bufnr)
					vim.lsp.inlay_hint.enable(true, vim.lsp.inlay_hint.get())
				end,
				-- cmd = { "gopls" },
				-- filetypes = { "go", "gomod", "gowork", "gotmpl" },
				settings = {
					gopls = {
						completeUnimported = true,
						-- usePlaceholders = true,
						analyses = {
							unusedparams = true,
							unusedvariable = true,
							shadow = true,
							simplifyslice = true,
							slog = true,
						},
						hints = {
							functionTypeParameters = true,
							parameterNames = true,
							constantValues = true,
							rangeVariableTypes = true,
							-- compositeLiteralTypes = true,
							-- compositeLiteralFields = true,
						},
						staticcheck = true,
					},
				},
			})
		end,
		vacuum = function()
			require("lspconfig").vacuum.setup({
				filetypes = "yaml",
			})
		end,
	},
})
