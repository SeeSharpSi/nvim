local sql_insert_mappings = {
    "<C-c>R",
    "<C-c>l",
    "<C-c>c",
    "<C-c>v",
    "<C-c>p",
    "<C-c>t",
    "<C-c>s",
    "<C-c>T",
    "<C-c>o",
    "<C-c>f",
    "<C-c>k",
    "<C-c>a",
    "<C-c>L",
}

for _, mapping in ipairs(sql_insert_mappings) do
    pcall(vim.keymap.del, "i", mapping, { buffer = 0 })
end

vim.keymap.set("n", "<leader>fs", function()
    local sleek = vim.fn.exepath("sleek")
    if sleek == "" then
        vim.notify("Sleek is not installed", vim.log.levels.WARN)
        return
    end

    local buffer = vim.api.nvim_get_current_buf()
    local changedtick = vim.api.nvim_buf_get_changedtick(buffer)
    local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)

    vim.system({ sleek }, {
        stdin = table.concat(lines, "\n"),
        text = true,
        timeout = 10000,
    }, function(result)
        vim.schedule(function()
            if result.code ~= 0 then
                local message = result.code == 124 and "Sleek timed out" or result.stderr
                vim.notify(message or "Sleek formatting failed", vim.log.levels.ERROR)
                return
            end

            if not vim.api.nvim_buf_is_valid(buffer) or not vim.bo[buffer].modifiable then
                return
            end

            if vim.api.nvim_buf_get_changedtick(buffer) ~= changedtick then
                vim.notify("SQL buffer changed before Sleek finished", vim.log.levels.WARN)
                return
            end

            local formatted = vim.split(result.stdout or "", "\n", { plain = true })
            if formatted[#formatted] == "" then
                table.remove(formatted)
            end
            vim.api.nvim_buf_set_lines(buffer, 0, -1, false, formatted)
        end)
    end)
end, { buffer = 0, silent = true, desc = "Format with Sleek" })
