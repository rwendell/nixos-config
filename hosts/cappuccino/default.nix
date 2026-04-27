{config, pkgs, inputs, ...} :

{
  imports = [
    ../shared.nix
    ./hardware-configuration.nix
    ../../modules/wireless.nix
    ../../modules/login.nix
    ../../modules/stylix.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen3
  ];

  nix.nixPath = [
    "nixpkgs=${inputs.nixpkgs}"
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  nix.registry = {
    nixpkgs.flake = inputs.nixpkgs;
  };

  boot.initrd.luks.devices."luks-99617911-0cdb-4012-b833-9b23bc548194".allowDiscards = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [ "quiet" "loglevel=3" "systemd.show_status=auto" ];

  boot.initrd.systemd.enable = true;

  environment.systemPackages = with pkgs; [ tpm2-tss ];

  cappuccino.enableWireless = true;

  networking.hostName = "cappuccino";

  programs.git.config.safe.directory = ["/etc/nixos"];

  programs.fish.shellAliases = {};

  cappuccino.enableLogin = true;

  # Darkman for auto dark/light mode switching
  # Managed at system level via systemd user service
  systemd.user.services.darkman = {
    enable = true;
    serviceConfig = {
      ExecStart = "${pkgs.darkman}/bin/darkman run";
      Type = "dbus";
      BusName = "nl.whynothugo.darkman";
    };
    environment = {
      DARKMAN_LAT = "42.35";   # TODO: Set your latitude
      DARKMAN_LNG = "-71.10"; # TODO: Set your longitude
      DARKMAN_USEGEOCLUE = "false"; # Set to "true" for auto location
    };
  };

  # Dark mode scripts (switch to dark specialisation)
  environment.etc."darkman/dark-mode.d/nixos-switch".text = ''
    #!/bin/sh
    doas nixos-rebuild switch --specialisation dark --flake /etc/nixos#cappuccino
  '';

  # Light mode scripts (switch to light specialisation)
  environment.etc."darkman/light-mode.d/nixos-switch".text = ''
    #!/bin/sh
    doas nixos-rebuild switch --specialisation light --flake /etc/nixos#cappuccino
  '';

  # Geoclue for darkman auto location (optional)
  services.geoclue2.enable = true;

  programs.niri.enable = true;

  # Specialisations for dark/light mode switching via darkman
  # Use lib.mkForce to override the inherited stylix.base16Scheme
  specialisation = {
    # Dark mode: Kanso Zen
    dark = {
      inheritParentConfig = true;
      configuration = { lib, ... }: {
        stylix.base16Scheme = lib.mkForce ./../../modules/themes/yaml/kanso-zen.yaml;
      };
    };
    # Light mode: Kanso Pearl
    light = {
      inheritParentConfig = true;
      configuration = { lib, ... }: {
        stylix.base16Scheme = lib.mkForce ./../../modules/themes/yaml/kanso-pearl.yaml;
      };
    };
  };
}