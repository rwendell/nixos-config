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

  plugins.dap-virtual-text = {
    enable = true;
  };
}