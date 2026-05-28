local header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

local in_git_repo = function()
  return Snacks.git.get_root() ~= nil
end

require("snacks").setup({
  statuscolumn = { enabled = true },
  gitbrowse = { enabled = true },
  lazygit = { enabled = true },
  dashboard = {
    enabled = true,
    preset = {
      header = header,
      keys = {
        { key = "f", desc = "Find file",     action = ":FzfLua files" },
        { key = "g", desc = "Live grep",     action = ":FzfLua live_grep" },
        { key = "r", desc = "Recent files",  action = ":FzfLua oldfiles" },
        { key = "n", desc = "New buffer",    action = ":enew" },
        { key = "t", desc = "File tree",     action = ":NvimTreeOpen" },
        { key = "G", desc = "Lazygit",       action = ":lua Snacks.lazygit()" },
        { key = "P", desc = "Open PRs (browser)",    action = function() vim.system({ "gh", "pr", "list", "--web" }) end },
        { key = "I", desc = "Open Issues (browser)", action = function() vim.system({ "gh", "issue", "list", "--web" }) end },
        { key = "c", desc = "Edit config",   action = ":edit " .. vim.fn.stdpath("config") .. "/init.lua" },
        { key = "k", desc = "Keybindings",   action = ":edit " .. vim.fn.stdpath("config") .. "/KEYBINDINGS.md" },
        { key = "q", desc = "Quit",          action = ":qa" },
      },
    },
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      { section = "recent_files", title = "Recent Files", limit = 5, padding = 1 },

      {
        pane = 2,
        title = "Open PRs",
        section = "terminal",
        enabled = in_git_repo,
        cmd = "gh pr list -L 6 2>/dev/null",
        height = 8,
        padding = 1,
        ttl = 5 * 60,
        indent = 2,
      },
      {
        pane = 2,
        title = "Open Issues",
        section = "terminal",
        enabled = in_git_repo,
        cmd = "gh issue list -L 6 2>/dev/null",
        height = 8,
        padding = 1,
        ttl = 5 * 60,
        indent = 2,
      },
      {
        pane = 2,
        title = "Git Status",
        section = "terminal",
        enabled = in_git_repo,
        cmd = "git -c color.status=always status -sb -uno 2>/dev/null | head -n 12",
        height = 10,
        padding = 1,
        ttl = 60,
        indent = 2,
      },

      function()
        local v = vim.version()
        return {
          text = { { string.format("Neovim %d.%d.%d", v.major, v.minor, v.patch), hl = "Comment" } },
          align = "center",
          padding = 1,
        }
      end,
    },
  },
})
