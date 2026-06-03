require("cmake-tools").setup({
  cmake_executor = {
    name = "quickfix",
    default_opts = {
      quickfix = {
        show = "always",
        position = "belowright",
        size = 12,
        encoding = "utf-8",
        auto_close_when_success = true,
      },
    },
  },
  cmake_runner = {
    name = "terminal",
    default_opts = {
      terminal = {
        name = "CMake Run",
        prefix_name = "[CMake]: ",
        split_direction = "horizontal",
        split_size = 12,
        single_terminal_per_instance = true,
        single_terminal_per_tab = true,
        start_insert = false,
        focus = false,
      },
    },
  },
  cmake_notifications = { enabled = true, spinner = true },
  cmake_regenerate_on_save = false,
  cmake_soft_link_compile_commands = true,
})

local map = function(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { desc = desc })
end

map("<leader>mg", "<cmd>CMakeGenerate<cr>",          "CMake: Generate (configure)")
map("<leader>mb", "<cmd>CMakeBuild<cr>",             "CMake: Build")
map("<leader>mr", "<cmd>CMakeRun<cr>",               "CMake: Run target")
map("<leader>mt", "<cmd>CMakeRunTest<cr>",           "CMake: Run tests")
map("<leader>mp", "<cmd>CMakeSelectBuildPreset<cr>", "CMake: Select preset")
map("<leader>mT", "<cmd>CMakeSelectBuildTarget<cr>", "CMake: Select target")
map("<leader>mc", "<cmd>CMakeClean<cr>",             "CMake: Clean")
map("<leader>ms", "<cmd>CMakeStopBuild<cr>",         "CMake: Stop build")
map("<leader>mo", "<cmd>CMakeOpenExecutor<cr>",      "CMake: Toggle output")

local function run_ctest_regex(pattern)
  if pattern == nil or pattern == "" then return end
  local build_dir = require("cmake-tools").get_build_directory()
  vim.cmd(("botright split | resize 15 | terminal ctest --test-dir %s -R %s --output-on-failure"):format(
    vim.fn.shellescape(tostring(build_dir)),
    vim.fn.shellescape(pattern)
  ))
end

vim.api.nvim_create_user_command("CTestR", function(opts)
  run_ctest_regex(opts.args)
end, { nargs = 1, desc = "ctest -R <regex> in the cmake-tools build dir" })

map("<leader>mtf", function()
  run_ctest_regex(vim.fn.input("ctest -R: "))
end, "CMake: ctest -R <regex>")
