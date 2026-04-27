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

  # Darkman for auto dark/light mode switching
  services.darkman = {
    enable = true;
    settings = {
      lat = 42.35;  # TODO: Set your latitude
      lng = -71.10; # TODO: Set your longitude
      usegeoclue = false; # Set to true for auto location via geoclue
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
