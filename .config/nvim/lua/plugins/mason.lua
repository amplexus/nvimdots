-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",

        -- install any other package
        "taplo",
        "jdtls",
        "java-test",
        "java-debug-adapter",
 			  "eslint-lsp",
 			  "lua-language-server",
 			  "emmet-ls",
 			  "css-lsp",
 			  "html-lsp",
 			  "vtsls",
 			  "yaml-language-server",
        "js-debug-adapter",
 			  "tailwindcss-language-server",
 			  "bash-language-server",
 			  "shellcheck",
 			  "shfmt",
 			  "json-lsp",
 			  "basedpyright",
 			  "black",
 			  "clangd",
 			  "codelldb",
 			  "lemminx",
 			  "marksman",
 			  "dockerfile-language-server",
 			  "docker-compose-language-service",
 			  "prettierd",
      },
    },
  },
}
