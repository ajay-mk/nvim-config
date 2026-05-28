require("cmake-tools").setup({
  cmake_command = "cmake",
  cmake_build_directory = "build/${variant:buildType}",
  cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
  ctest_show_labels = true,
  cmake_console_size = 12,
  cmake_show_console = "always",
  cmake_executor = {
    name = "toggleterm",
    opts = {
      direction = "horizontal",
      close_on_exit = false,
      auto_scroll = true,
    },
  },
  cmake_runner = {
    name = "toggleterm",
    opts = {
      direction = "horizontal",
      close_on_exit = false,
      auto_scroll = true,
    },
  },
  cmake_dap_configuration = {
    name = "cpp",
    type = "codelldb",
    request = "launch",
  },
})

vim.keymap.set("n", "<leader>cg", "<cmd>CMakeGenerate<cr>", { desc = "CMake generate" })
vim.keymap.set("n", "<leader>cb", "<cmd>CMakeBuild<cr>", { desc = "CMake build" })
vim.keymap.set("n", "<leader>cB", "<cmd>CMakeBuildCurrentFile<cr>", { desc = "Build current file target" })
vim.keymap.set("n", "<leader>cr", "<cmd>CMakeRun<cr>", { desc = "CMake run" })
vim.keymap.set("n", "<leader>cR", "<cmd>CMakeRunCurrentFile<cr>", { desc = "Run current file target" })
vim.keymap.set("n", "<leader>cd", "<cmd>CMakeDebug<cr>", { desc = "CMake debug" })
vim.keymap.set("n", "<leader>cD", "<cmd>CMakeDebugCurrentFile<cr>", { desc = "Debug current file target" })
vim.keymap.set("n", "<leader>ct", "<cmd>CMakeSelectBuildType<cr>", { desc = "Select build type" })
vim.keymap.set("n", "<leader>cp", "<cmd>CMakeSelectConfigurePreset<cr>", { desc = "Select configure preset" })
vim.keymap.set("n", "<leader>cP", "<cmd>CMakeSelectBuildPreset<cr>", { desc = "Select build preset" })
vim.keymap.set("n", "<leader>cs", "<cmd>CMakeSelectBuildTarget<cr>", { desc = "Select build target" })
vim.keymap.set("n", "<leader>cl", "<cmd>CMakeSelectLaunchTarget<cr>", { desc = "Select launch target" })
vim.keymap.set("n", "<leader>ca", "<cmd>CMakeLaunchArgs<cr>", { desc = "Set launch args" })
vim.keymap.set("n", "<leader>cT", "<cmd>CMakeSelectTestPreset<cr>", { desc = "Select test preset" })
vim.keymap.set("n", "<leader>cx", "<cmd>CMakeRunTest<cr>", { desc = "Run CTest" })
vim.keymap.set("n", "<leader>ce", "<cmd>CMakeOpenExecutor<cr>", { desc = "Open CMake executor" })
vim.keymap.set("n", "<leader>cv", "<cmd>CMakeOpenRunner<cr>", { desc = "Open CMake runner" })
vim.keymap.set("n", "<leader>cX", "<cmd>CMakeStopRunner<cr>", { desc = "Stop CMake runner" })
vim.keymap.set("n", "<leader>cc", "<cmd>CMakeClean<cr>", { desc = "CMake clean" })
