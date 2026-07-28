local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"
local lock = vim.json.decode(table.concat(vim.fn.readfile(lockfile), "\n"))
local lazy_commit = assert(lock["lazy.nvim"] and lock["lazy.nvim"].commit, "lazy.nvim is missing from lazy-lock.json")

local function git(args)
    local command = { "git" }
    vim.list_extend(command, args)
    local result = vim.system(command, { text = true }):wait(120000)
    if result.code ~= 0 then
        local message = result.stderr
        if not message or message == "" then
            message = table.concat(command, " ") .. " failed"
        end
        error(message)
    end
    return vim.trim(result.stdout or "")
end

if not vim.loop.fs_stat(lazypath) then
    git({
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

if git({ "-C", lazypath, "rev-parse", "HEAD" }) ~= lazy_commit then
    local checkout = vim.system({ "git", "-C", lazypath, "checkout", "--detach", lazy_commit }, { text = true }):wait(30000)
    if checkout.code ~= 0 then
        git({ "-C", lazypath, "fetch", "--depth=1", "origin", lazy_commit })
        git({ "-C", lazypath, "checkout", "--detach", lazy_commit })
    end
end

if git({ "-C", lazypath, "status", "--porcelain", "--untracked-files=all" }) ~= "" then
    error("lazy.nvim has local changes; refusing to execute an unverified checkout")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {})
