-- CHeck nvim version -- done
-- check dependencies - python-venv npm ripgrep python luarocks lua git gcc g++
-- cmake zip curl bash
local dependencies = {}

-- Ripgrep cmd and name
local ripgrep = { cmd = 'rg', name = 'ripgrep',
    install_method = string.format('sudo apt install %s', 'ripgrep')}
table.insert(dependencies, ripgrep)
-- Curl cmd
local curl = {cmd = 'curl', name = 'curl',
    install_method = string.format('sudo apt install %s', 'curl')}
table.insert(dependencies, curl)
-- lua
local lua = {cmd = 'lua', name = 'lua',
    install_method = string.format('sudo apt install %s', 'lua')}
table.insert(dependencies, lua)
-- luarocks
local luarocks = {cmd = 'luarocks', name = 'luarocks',
    install_method = string.format('sudo apt install %s', 'luarocks')}
table.insert(dependencies, luarocks)
-- git
local git = {cmd = 'git', name = 'git',
    install_method = string.format('sudo apt install %s', 'git')}
table.insert(dependencies, git)
-- python
local python = {cmd = 'python', name = 'python',
    install_method = string.format('sudo apt install %s3.12', 'python')}
table.insert(dependencies, python)
-- pip
local pip = {cmd = 'pip', name = 'pip',
    install_method = string.format('sudo apt install python3-%s', 'pip')}
table.insert(dependencies, pip)
-- npm
local npm = {cmd = 'npm', name = 'npm',
    install_method = string.format('sudo apt install %s', 'npm')}
table.insert(dependencies, npm)
-- fdfind
local fdfind = {cmd = 'fdfind', name = 'fd-find',
    install_method = string.format('sudo apt install %s', 'fd-find')}
table.insert(dependencies, fdfind)

local attempt_cmd = function(opts)
    if vim.fn.executable(opts.cmd) == 1 then
        vim.health.ok(("Installed: %s"):format(opts.name))
    else
        vim.health.warn(("Missing: %s"):format(opts.name))
        vim.health.info(opts.install_method)
    end
end

local checkversion = function()
    local versionstring = tostring(vim.version())

    if not vim.version.ge then
        vim.health.error("Nvim out of date")
    end

    if vim.version.lt(vim.version(), "0.10-dev") then
        vim.health.error(string.format("Nvim out of date, current: %s,  minimum: 0.10-dev", versionstring))
    end
end

local checkrequire = function()
    for _, deps in ipairs(dependencies) do
        attempt_cmd(deps)
    end
end

return {
    check = function ()
        -- vim.health.warn(vim.bo.fileformat:upper())
        -- vim.health.warn(vim.uv.os_environ().DESKTOP_SESSION)
        vim.health.start ("Nvim installation package")

        vim.health.info("[Not all warns is a must fix from checkhealth]" .. '\n' ..  
                        "plugins will complain if packages are missing")

        vim.health.info(string.format("System info: ".. vim.inspect(vim.uv.os_environ().DESKTOP_SESSION)))

        checkversion()
        checkrequire()
    end,
}
