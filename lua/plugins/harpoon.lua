-- lua/plugins/harpoon.lua
return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },

  -- These keys lazy-load Harpoon.
  keys = {
    -- This explicitly DISABLES the default LazyVim window-nav keys
    { "<C-h>", false },
    { "<C-j>", false },
    { "<C-k>", false },
    { "<C-l>", false },

    -- Harpoon mappings
    { "<leader>a", function() require("harpoon.mark").add_file() end, desc = "Harpoon add file" },
    { "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon quick menu" },
    { "<C-h>", function() require("harpoon.ui").nav_file(1) end, desc = "Harpoon nav file 1" },
    { "<C-j>", function() require("harpoon.ui").nav_file(2) end, desc = "Harpoon nav file 2" },
    { "<C-k>", function() require("harpoon.ui").nav_file(3) end, desc = "Harpoon nav file 3" },
    { "<C-l>", function() require("harpoon.ui").nav_file(4) end, desc = "Harpoon nav file 4" },
  },
}
