vim.g.mapleader = " "

-- remove keymaps
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grn")

-- dont yank when changing
vim.keymap.set("n", "c", '"_c', { noremap = true })

-- closing
vim.keymap.set("n", "<leader>q", "<cmd>NvimTreeClose|q!<cr>", { desc = "Close without saving" })
vim.keymap.set("n", "<leader>x", "<cmd>NvimTreeClose|x<cr>", { desc = "Save and close" })

-- buffers
vim.keymap.set("n", "<tab>", "<cmd>bn<cr>")
vim.keymap.set("n", "<S-tab>", "<cmd>bp<cr>")
vim.keymap.set("n", "<leader>d", ":bdelete<CR>:bnext<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write buffer" })

-- file tree
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<cr>")

-- comments
vim.keymap.set("n", "<C-/>", "gcc", { remap = true })
vim.keymap.set("v", "<C-/>", "gcc<Esc>", { remap = true })

-- lines
vim.keymap.set("n", "<C-S-Down>", "yyp", { remap = true })
vim.keymap.set("n", "<C-S-up>", "yyp", { remap = true })
vim.keymap.set("i", "<C-S-Down>", "yyp", { remap = true })
vim.keymap.set("i", "<C-S-up>", "yyp", { remap = true })

-- commands
vim.keymap.set("n", ";", ":", { remap = true })

-- replace
vim.keymap.set("n", "<leader>r", "*``cgn", { desc = "Rename variable" })

-- inc/dec
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- arrow moving
vim.keymap.set("n", "<C-Right>", "e")
vim.keymap.set("v", "<C-Right>", "e")
vim.keymap.set("v", "<C-Left>", "b")
vim.keymap.set("n", "<C-Left>", "b")

-- moving lines
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { silent = true })
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true })

-- LSP
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" }) -- show lsp implementations
vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" }) -- show lsp type definitions
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" }) -- see available code actions, in visual mode will apply to selection
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Smart rename" }) -- smart rename
vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })

-- leap: search both ways
vim.keymap.set("n", "s", function()
	require("leap").leap({ target_windows = { vim.api.nvim_get_current_win() } })
end)

-- inlay hints
vim.keymap.set("n", "<leader>h", function()
	local is_enabled = vim.lsp.inlay_hint.is_enabled({})
	vim.lsp.inlay_hint.enable(not is_enabled)

	if is_enabled then
		print("Inlay hints disabled")
	else
		print("Inlay hints enabled")
	end

	vim.defer_fn(function()
		vim.cmd('echo ""')
	end, 3000)
end, { desc = "Toggle inlay hints" })
