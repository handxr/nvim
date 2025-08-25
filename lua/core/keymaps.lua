vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Formatear archivo" }) 

vim.keymap.set("i", "jj", "<Esc>", { desc = "Salir del modo insert" }) 