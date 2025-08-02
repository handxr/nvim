return {
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
} 