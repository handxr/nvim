-- Plugins minimalistas para frontend con lazy.nvim
require("lazy").setup({
  -- Theme Catppuccin (Macchiato)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
      })
      vim.cmd.colorscheme "catppuccin-macchiato"
    end,
  },
  -- Syntax highlight
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "typescript", "html", "css", "lua", "json" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end
      lspconfig.ts_ls.setup({ on_attach = on_attach })
      lspconfig.html.setup({ on_attach = on_attach })
      lspconfig.cssls.setup({ on_attach = on_attach })
      lspconfig.eslint.setup({ on_attach = on_attach })
      lspconfig.tailwindcss.setup({ on_attach = on_attach })
    end,
  },
  -- Autocompletado
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
        },
      })
    end,
  },
  -- Linter/Formatter: null-ls para prettier, eslint, biome
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier.with({
            condition = function(utils)
              return utils.root_has_file({ ".prettierrc", ".prettierrc.js", ".prettierrc.json" })
            end,
          }),
          null_ls.builtins.formatting.biome.with({
            condition = function(utils)
              return utils.root_has_file({ "biome.json" })
            end,
          }),
        },
      })
    end,
  },
  -- Explorador de archivos: nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        renderer = { group_empty = true },
        filters = { dotfiles = false },
      })
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Abrir/cerrar NvimTree" })
    end,
  },
  -- Buscador de archivos: telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Buscar archivos" })
      vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Buscar texto" })
      vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Buffers abiertos" })
      vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Buscar ayuda" })
    end,
  },
  -- Autopairs: autocierra (), {}, []
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  -- Autotag: autocierra etiquetas HTML y JSX
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },

  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {} -- your configuration
  }
  
  
 
})

-- Atajo para formatear
vim.keymap.set("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Formatear archivo" }) 