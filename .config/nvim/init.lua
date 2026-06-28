require("config.lazy")
require("keymaps.oil_keymaps")
require("keymaps.fzf_keymaps")
require("keymaps.lsp_keymaps")
require("visual.base_visuals")
--require("lsp.lsp_setup")

---=== Basics/Core settings ===---
vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"

-- Tab width + spaces stuff
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true


-- Stores undo history accross sessions
vim.opt.undofile = true
vim.cmd("colorscheme kanagawa-dragon")
vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
virtual_text = {
    spacing = 2,
    -- prefix = "●",
    signs = true,
  },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function(ev)
    local ft = vim.bo[ev.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)

    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start(ev.buf, lang)
    end
  end,
})
