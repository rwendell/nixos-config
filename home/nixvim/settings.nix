{ lib, ... }:
{
  settings = {
    number = true;
    relativenumber = true;
    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;
    swapfile = false;
    backup = false;
    undofile = true;
    hlsearch = true;
    incsearch = true;
    termguicolors = true;
    scrolloff = 8;
    updatetime = 50;
    clipboard = "unnamedplus";
    breakindent = true;
    ignorecase = true;
    smartcase = true;
    splitright = true;
    splitbelow = true;
    inccommand = "split";
    confirm = true;
  };
}