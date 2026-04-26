{ lib, ... }:
{
  plugins.dap = {
    enable = true;
  };

  plugins.dap-python = {
    enable = true;
  };

  plugins.dap-view = {
    enable = true;
  };
}