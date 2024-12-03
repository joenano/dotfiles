return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig["biome"].setup({
			capabilities = capabilities,
			cmd = { "biome", "lsp-proxy" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"json",
				"jsonc",
				"typescript",
				"typescript.tsx",
				"typescriptreact",
				"svelte",
				"css",
			},
			root_dir = lspconfig.util.root_pattern("biome.json"),
		})

		lspconfig["html"].setup({
			capabilities = capabilities,
		})

		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
		})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
		})

		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
		})

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--fallback-style=webkit",
			},
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
		})

		lspconfig["nginx_language_server"].setup({
			capabilities = capabilities,
		})

		lspconfig["zls"].setup({
			capabilities = capabilities,
		})

		lspconfig["nimls"].setup({
			capabilities = capabilities,
		})

		lspconfig["jsonls"].setup({
			capabilities = capabilities,
		})

		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					telemetry = { enable = false },
					hint = { enable = true },
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["ruff"].setup({
			init_options = {
				settings = {
					args = { "--config", "~/.config/ruff/pyproject.toml" },
				},
			},
		})
	end,
}
