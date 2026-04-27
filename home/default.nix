{inputs, config, pkgs, ...} :

{
  imports = [
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

  # Darkman for auto dark/light mode switching (home-manager module)
  services.darkman = {
    enable = true;
    settings = {
      lat = 41.8781;  # Chicago area (fallback if geoclue fails)
      lng = -87.6298;
      usegeoclue = true; # Auto-detect location via geoclue
      dbusserver = true;
      portal = true;
    };
    darkModeScripts = {
      "nixos-switch" = "doas nixos-rebuild switch --specialisation dark --flake /etc/nixos#cappuccino";
    };
    lightModeScripts = {
      "nixos-switch" = "doas nixos-rebuild switch --specialisation light --flake /etc/nixos#cappuccino";
    };
  };

 	home.stateVersion = "26.05";
}
