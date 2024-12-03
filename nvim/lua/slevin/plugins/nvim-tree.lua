return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
				git_clean = false,
				no_buffer = false,
				custom = { "node_modules", ".\\.lock.", "target", ".axiom", ".git", "dist" },
				exclude = { ".gitignore", "data", "logs", ".cargo" },
			},
		})

		vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<cr>")
	end,
}

