return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set('n', '<leaderLu', function()
            vim.cmd.UndotreeToggle()
            vim.cmd('UndotreeFocus')
        end)
    end
}
