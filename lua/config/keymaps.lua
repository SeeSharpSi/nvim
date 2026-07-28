-- Lazy-loading plugin mappings live with their specs in lua/plugins.
-- Buffer-specific mappings live in after/ftplugin or the owning plugin config.
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h", { silent = true })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
    local config_dir = vim.uv.fs_realpath(vim.fn.stdpath("config"))
    local file = vim.uv.fs_realpath(vim.api.nvim_buf_get_name(0))

    if config_dir then
        config_dir = vim.fs.normalize(config_dir)
    end
    if file then
        file = vim.fs.normalize(file)
    end

    if not file or not config_dir or (file ~= config_dir and not vim.startswith(file, config_dir .. "/")) then
        vim.notify("Only files inside the Neovim config can be sourced", vim.log.levels.WARN)
        return
    end

    vim.cmd.source(file)
end, { desc = "Source current config file" })

vim.keymap.set("n", "<C-[>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-]>", "<cmd>cprev<CR>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
vim.keymap.set("n", "<M-t>", "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>")
vim.keymap.set("n", "<M-n>", "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>")
vim.keymap.set("n", "<M-s>", "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>")
