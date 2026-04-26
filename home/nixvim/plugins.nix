{ lib, ... }:
{
  plugins.treesitter.enable = true;

  plugins.lsp.servers = {
    nil_ls.enable = true;
    rustaceanui.enable = true;
    ts_ls.enable = true;
    gopls.enable = true;
    pyright.enable = true;
  };

  plugins.lualine = {
    enable = true;
    autoLoad = true;
  };

  plugins.which-key = {
    enable = true;
  };

  plugins.blink-cmp = {
    enable = true;
  };

  plugins.gitsigns = {
    enable = true;
  };

  plugins.telescope = {
    enable = true;
  };
}