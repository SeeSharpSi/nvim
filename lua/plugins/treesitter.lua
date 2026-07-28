return {
  -- 1. NVIM-TREESITTER (main plugin)
  {
    "nvim-treesitter/nvim-treesitter",
    
    config = function()
      if not vim.g.ts_get_node_text_compat then
        local original_get_node_text = vim.treesitter.get_node_text
        vim.treesitter.get_node_text = function(node, source, opts)
          if type(node) == "table" then
            node = node[1]
          end
          if not node then
            return ""
          end
          return original_get_node_text(node, source, opts)
        end
        vim.g.ts_get_node_text_compat = true
      end

      require'nvim-treesitter.configs'.setup {
        auto_install = false,
        highlight = {
          enable = true,
          disable = function(lang)
            return lang == "markdown" or lang == "markdown_inline"
          end,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },

  -- 2. TREESITTER-CONTEXT
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
}
