{ inputs, config, pkgs, lib, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.agenix.homeManagerModules.default
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

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

    plugins = {
      treesitter.enable = true;
      lsp.servers = {
        nil_ls.enable = true;
        rustaceanui.enable = true;
        ts_ls.enable = true;
        gopls.enable = true;
        pyright.enable = true;
      };
    };
  };

  programs.fish = {
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake .#cappuccino";
    };
  };

  age.identityPaths = [ "/home/rwendell/.ssh/id_ed25519" ];

  programs.git = {
    enable = true;
    settings = {
      user.email = "ryanjwendell@gmail.com";
      user.name = "Ryan Wendell";
      init.defaultBranch = "main";
      "github.com".identityFile = config.age.secrets.git-ssh-key.path;
    };
  };

  age.secrets.git-ssh-key = {
    file = ../secrets/git-ssh-key.age;
    mode = "0600";
  };

  home.stateVersion = "26.05";
}