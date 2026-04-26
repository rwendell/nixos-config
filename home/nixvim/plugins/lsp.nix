{ lib, ... }:
{
  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;
    folding.enable = true;
  };

  plugins.lsp.servers = {
    nil_ls.enable = true;
    rustaceanui.enable = true;
    ts_ls.enable = true;
    gopls.enable = true;
    pyright.enable = true;
    yamlls.enable = true;
    ruff_lsp.enable = true;
    jsonls.enable = true;
  };

  plugins.lint = {
    enable = true;
    autoLoad = true;
  };

  plugins.mason = {
    enable = true;
  };
}