return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8', --
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-frecency.nvim'
    },
    lazy = true,

    config = function() 
        require("telescope").setup {
            extensions = {
                frecency = { 
                    path_display = { "smart" },
                    show_scores = true,
                    workspace = "CWD",
                },
            },
        }
        require("telescope").load_extension("frecency")
    end,

    -- These keys lazy-load Telescope.
    keys = {
        { '<leader>pf', "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { '<C-p>', function()
            require('telescope.builtin').git_files()
        end, desc = "Git Files" },
        { '<leader>ps', function()
            require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") });
        end, desc = "Grep String"
    },
    { 'gr', function()
        require('telescope.builtin').lsp_references()
    end, desc = 'LSP References' },
    { '<leader>fr', "<cmd>Telescope frecency<cr>", desc = "Frecency" },
    { '<leader>fR', "<cmd>FrecencyDelete<cr>", desc = "Deletes current buffer from Frecency db with FrecencyDelete" },
},

}
