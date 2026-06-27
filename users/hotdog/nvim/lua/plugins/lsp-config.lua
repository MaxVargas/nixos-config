return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    branch = "main",
    opts = {
      automatic_enable = {
        exclude = { "rust_analyzer" }; -- NixOS issue... no FHS dynamically linked executable
      },
      ensure_installed = {
        "lua_ls",
        "pyright",
        "pyright",
        "ts_ls",
        "clangd",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
    dependencies = {
      -- main one
      { "ms-jpq/coq_nvim", branch = "coq" },

      -- 9000+ Snippets
      { "ms-jpq/coq.artifacts", branch = "artifacts" },

      -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
      -- Need to **configure separately**
      { 'ms-jpq/coq.thirdparty', branch = "3p" }
      -- - shell repl
      -- - nvim lua api
      -- - scientific calculator
      -- - comment banner
      -- - etc
    },
    init = function()
      vim.g.coq_settings = {
          auto_start = true, -- if you want to start COQ at startup
          -- Your COQ settings here
      }
    end,
    config = function()
      local lsps = {
        { "lua_ls" },
        { "pyright" },
        { "ts_ls" },
        { "rust_analyzer" },
      }

      for _, lsp in pairs(lsps) do
        local name, config = lsp[1], lsp[2]
        vim.lsp.enable(name)
        if config then
          vim.lsp.config(name, config)
        end
      end
    end
  },
}
