return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- Carrega o plugin um pouco antes de salvar um buffer
  cmd = { "ConformInfo" },
  opts = {
    -- Configura uma notificação para quando o formatador não estiver disponível
    notify_on_error = true,
    -- Configuração para rodar a formatação ao salvar (format_on_save)
    -- Isso é o mais recomendado!
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true, -- Se o formatador falhar, tenta usar o LSP
    },
    -- Define os formatadores para cada tipo de arquivo (filetype)
    formatters_by_ft = {
      -- JavaScript e seus frameworks
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },

      -- Outros arquivos comuns em projetos web
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },

      -- Para sua configuração do Neovim :)
      lua = { "stylua" },
    },
  },
  -- Configuração adicional para garantir que tudo funcione bem
  config = function(_, opts)
    require("conform").setup(opts)

    -- Adiciona um atalho para formatar manualmente, caso você precise
    -- A tecla líder é geralmente a barra de espaço. Então seria: <espaço> + f
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format buffer or selection" })
  end,
}
