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
    rustaceanvim.enable = true;
    ts_ls.enable = true;
    gopls.enable = true;
    pyright.enable = true;
    yamlls.enable = true;
    ruff.enable = true;
    jsonls.enable = true;
  };

  plugins.lint = {
    enable = true;
    autoLoad = true;
    lintersByFt = {
      yaml = [ "yamllint" ];
    };
  };
}