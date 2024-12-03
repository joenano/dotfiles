return {
	"voldikss/vim-floaterm",
	event = "VeryLazy",
	-- keys = {
	-- 	{ "<leader>t", "<cmd>FloatermToggle<cr>", desc = "Terminal" },
	-- },
	config = function()
		vim.api.nvim_set_keymap("n", "<Leader>t", ":FloatermToggle<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("t", "<Leader>t", "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true, silent = true })
	end,
}
