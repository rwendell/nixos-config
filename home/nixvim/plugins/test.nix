{ lib, ... }:
{
  plugins.neotest = {
    enable = true;
    adapters.plenary.enable = true;
  };

  plugins.dashboard = {
    enable = true;
  };
}