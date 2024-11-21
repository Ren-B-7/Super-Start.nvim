local health = vim.health
-- CHeck nvim version -- done
-- check dependencies - python-venv npm ripgrep python luarocks lua git gcc g++
-- cmake zip curl bash
local dependencies = {}

-- Ripgrep cmd and name
table.insert(
	dependencies,
	{ cmd = "rg", name = "ripgrep", install_method = string.format("sudo apt install %s", "ripgrep") }
)
-- Curl cmd
table.insert(
	dependencies,
	{ cmd = "curl", name = "curl", install_method = string.format("sudo apt install %s", "curl") }
)
-- lua
table.insert(dependencies, { cmd = "lua", name = "lua", install_method = string.format("sudo apt install %s", "lua") })
-- luarocks
table.insert(
	dependencies,
	{ cmd = "luarocks", name = "luarocks", install_method = string.format("sudo apt install %s", "luarocks") }
)
-- git
table.insert(dependencies, { cmd = "git", name = "git", install_method = string.format("sudo apt install %s", "git") })
-- python
table.insert(
	dependencies,
	{ cmd = "python", name = "python", install_method = string.format("sudo apt install %s3.12", "python") }
)
-- pip
table.insert(
	dependencies,
	{ cmd = "pip", name = "pip", install_method = string.format("sudo apt install python3-%s", "pip") }
)
-- npm
table.insert(dependencies, { cmd = "npm", name = "npm", install_method = string.format("sudo apt install %s", "npm") })
-- fdfind
table.insert(
	dependencies,
	{ cmd = "fdfind", name = "fd-find", install_method = string.format("sudo apt install %s", "fd-find") }
)
-- rust and cargo
table.insert(
	dependencies,
	{ cmd = "cargo", name = "rustup", install_method = string.format("sudo apt install %s", "rustup") }
)

local attempt_cmd = function(opts)
	if vim.fn.executable(opts.cmd) then
		health.ok(("Installed: %s"):format(opts.name))
	else
		health.warn(("Missing: %s"):format(opts.name))
		health.info(opts.install_method)
	end
end

local checkversion = function()
	local versionstring = tostring(vim.version())

	if not vim.version.ge then
		health.error("Nvim out of date")
	end

	if vim.version.lt(vim.version(), "0.10-dev") then
		health.error(string.format("Nvim out of date, current: %s,  minimum: 0.10-dev", versionstring))
	end
end

local checkrequire = function()
	for _, deps in ipairs(dependencies) do
		attempt_cmd(deps)
	end
end

return {
	check = function()
		-- health.warn(vim.bo.fileformat:upper())
		-- health.warn(vim.uv.os_environ().DESKTOP_SESSION)
		health.start("Nvim installation package")

		health.info(
			"[Not all warns is a must fix from checkhealth]" .. "\n" .. "plugins will complain if packages are missing"
		)

		health.info(string.format("System info: " .. vim.inspect(vim.uv.os_environ().DESKTOP_SESSION)))

		checkversion()
		checkrequire()
	end,
}
