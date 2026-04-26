{ inputs, config, pkgs, lib, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.agenix.homeManagerModules.default
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    imports = [
      ./nixvim/settings.nix
      ./nixvim/plugins.nix
    ];
  };

  programs.fish.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake .#cappuccino";
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