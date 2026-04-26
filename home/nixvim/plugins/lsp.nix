{ lib, ... }:
{
  plugins.treesitter.enable = true;

  plugins.lsp.servers = {
    nil_ls.enable = true;
    rustaceanui.enable = true;
    ts_ls.enable = true;
    gopls.enable = true;
    pyright.enable = true;
    yamlls.enable = true;
    ruff-lsp.enable = true;
    nil-ls.enable = true;
  };
}