return {
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
} 