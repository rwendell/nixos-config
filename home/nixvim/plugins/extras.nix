{ lib, ... }:
{
  plugins.snacks = {
    enable = true;
    autoLoad = true;
  };

  plugins.noice = {
    enable = true;
    autoLoad = true;
  };

  plugins.conform-nvim = {
    enable = true;
    autoLoad = true;
  };

  plugins.lazydev = {
    enable = true;
  };

  plugins.todo-comments = {
    enable = true;
  };
}