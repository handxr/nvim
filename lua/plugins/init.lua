local plugins = {
  require("plugins.config.theme"),
  require("plugins.config.treesitter"),
  require("plugins.config.lsp"),
  require("plugins.config.cmp"),
  require("plugins.config.formatters"),
  require("plugins.config.nvim-tree"),
  require("plugins.config.telescope"),
  require("plugins.config.autopairs"),
  require("plugins.config.autotag"),
  require("plugins.config.tailwind"),
  require("plugins.config.copilot"),
}

require("lazy").setup(plugins) 