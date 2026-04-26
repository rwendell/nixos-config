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

  plugins.ts-comments = {
    enable = true;
  };

  plugins.schemastore = {
    enable = true;
  };

  plugins.vimtex = {
    enable = true;
  };

  plugins.yanky = {
    enable = true;
  };

  plugins.fidget = {
    enable = true;
  };
}