local lsp_zero = require("lsp-zero")

local lsp_attach = function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end

lsp_zero.extend_lspconfig({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	lsp_attach = lsp_attach,
	float_border = "rounded",
	sign_text = true,
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
					},
				},
			})
		end,
	},
})
