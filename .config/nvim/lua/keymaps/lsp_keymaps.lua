vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
  desc = "Rename occerences",
  nowait = true
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
  desc = "Go to definition",
  nowait = true
})

vim.keymap.set("n", "gf", vim.lsp.buf.declaration, {
  desc = "Go to declaration"
})

vim.keymap.set("n", "<S-F><S-F>", vim.lsp.buf.format, {
  desc = "Format file"
})

