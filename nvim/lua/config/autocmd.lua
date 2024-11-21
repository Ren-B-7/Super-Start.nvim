local nvim_create = vim.api.nvim_create_autocmd
nvim_create("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({})
	end,
	desc = "highlights yank",
})
-- nvim_create("WinEnter", {
--	callback = function()
--		require("utils.functions").reload_nvim_tree(require("utils.functions").OFF)
--	end,
--	desc = "reload line numbers",
--})
-- nvim_create({ "WinEnter" }, {
-- 	callback = function()
-- 		-- require("transparent").toggle(vim.g.transparent_enabled)
-- 		-- vim.cmd(":silent exec '!kill -s SIGWINCH $PPID'")
-- 		-- local pid, WINCH = vim.fn.getpid(), vim.loop.constants.SIGWINCH
-- 		-- vim.defer_fn(function()
-- 		-- 	vim.loop.kill(pid, WINCH)
-- 		-- end, 20)
-- 	end,
-- })
