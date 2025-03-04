-- Run gofmt + goimports on save

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimports()
	end,
	group = format_sync_grp,
})

vim.keymap.set("n", "<leader>gt", vim.cmd.GoTest)
vim.keymap.set("n", "<leader>ge", vim.cmd.GoIfErr)
vim.keymap.set("n", "<leader>gf", vim.cmd.GoFillStruckt)
vim.keymap.set("n", "<leader>gt", vim.cmd.GoAddTag)
