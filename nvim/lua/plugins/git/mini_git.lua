return {
	"echasnovski/mini-git",
	version = "*",
	main = "mini.git",
	lazy = true,
	cmd = "Git",
	config = true,
	opts = {
		job = {
			git_executable = "git",
			timeout = 30000,
		},

		command = {
			split = "auto",
		},
	},
}
