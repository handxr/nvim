-- Minimal Neovim config for frontend (init.lua)
-- Carga lazy.nvim y la configuración modular

-- Ruta de lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
require("config.options")
require("config.lazy") 

-- Diagnostics inline (sin plugins)
vim.diagnostic.config({
  virtual_text = true, -- Muestra los diagnostics inline
  signs = true,        -- Muestra los signos en el gutter
  underline = true,    -- Subraya el texto con error
  update_in_insert = false, -- No actualiza en modo insert
}) 