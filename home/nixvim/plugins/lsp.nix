{ lib, ... }:
{
  plugins.lsp.servers = {
    nil_ls.enable = true;
    rustaceanui.enable = true;
    ts_ls.enable = true;
    gopls.enable = true;
    pyright.enable = true;
  };
}