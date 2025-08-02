return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "javascript", "typescript", "html", "css", "lua", "json" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
} 