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
      usegeoclue = true; # Enable auto location detection
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
