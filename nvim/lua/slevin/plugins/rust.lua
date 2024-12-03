return {
	"mrcjkb/rustaceanvim",
	version = "^4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
	ft = { "rust" },
	config = function()
		vim.g.rustaceanvim = {
			inlay_hints = {
				highlight = "NonText",
			},
			tools = {
				hover_actions = {
					auto_focus = true,
				},
			},
			server = {
				on_attach = function(client, bufnr) end,
			},
		}
	end,
}
