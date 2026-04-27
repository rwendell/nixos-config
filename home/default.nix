{inputs, config, pkgs, ...} :

{
  imports = [
    ./stylix.nix
    ./niri.nix
    inputs.nixvim.homeModules.nixvim
    inputs.agenix.homeManagerModules.default
    ./lock-screen.nix
    ./nixvim
  ];

  programs.nixvim.enable = true;

  programs.vicinae = {
    enable = true;
  };

  services.darkman = {
    enable = true;
    settings = {
      latitude = 41.8781;
      longitude = -87.6298;
      useGeoclue = true;
    };
  };

  xdg.dataFile = {
    "darkman/dark-mode.d/nixos-switch".text = ''
      #!/bin/sh
      exec /run/current-system/sw/bin/nixos-rebuild switch --specialisation dark --flake /etc/nixos#cappuccino
    '';
    "darkman/light-mode.d/nixos-switch".text = ''
      #!/bin/sh
      exec /run/current-system/sw/bin/nixos-rebuild switch --specialisation light --flake /etc/nixos#cappuccino
    '';
  };

  home.stateVersion = "26.05";
}
