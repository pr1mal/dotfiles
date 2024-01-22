-- arduino integration

return {
  {
    "glebzlat/Arduino.nvim",
    branch = "dev",
    lazy = true,
    config = function()
      local ok, arduino = pcall(require, "arduino")
      if not ok then
        print("cannot load arduino-nvim")
      end
      arduino.setup({
        default_fqbn = "arduino:avr:uno",

        --Path to clangd (all paths must be full)
        clangd = "/usr/local/opt/llvm/bin/clangd",

        --Path to arduino-cli
        arduino = "/usr/local/bin/arduino-cli",

        --Data directory of arduino-cli
        arduino_config_dir = vim.env.HOME .. "/Library/Arduino15",

        -- Extra options to arduino-language-server
        extra_opts = {},
      })

      require("lspconfig")["arduino_language_server"].setup({
        on_new_config = arduino.on_new_config,
      })
    end,
  },
}
