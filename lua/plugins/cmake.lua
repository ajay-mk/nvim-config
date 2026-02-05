return {
  "Civitasv/cmake-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" },
  cmd = {
    "CMakeGenerate",
    "CMakeBuild",
    "CMakeRun",
    "CMakeDebug",
    "CMakeSelectBuildType",
    "CMakeSelectBuildTarget",
    "CMakeSelectLaunchTarget",
    "CMakeClean",
  },
  keys = {
    { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
    { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
    { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
    { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
    { "<leader>ct", "<cmd>CMakeSelectBuildType<cr>", desc = "Select Build Type" },
    { "<leader>cs", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Select Build Target" },
    { "<leader>cl", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "Select Launch Target" },
    { "<leader>cc", "<cmd>CMakeClean<cr>", desc = "CMake Clean" },
  },
  opts = {
    cmake_command = "cmake",
    cmake_build_directory = "build/${variant:buildType}",
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_options = {},
    cmake_console_size = 10,
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
      type = "lldb",
      request = "launch",
    },
  },
}
