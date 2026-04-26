{config, pkgs, inputs, ...} :

{
  imports = [
    ../shared.nix
    ./hardware-configuration.nix
    ../../modules/wireless.nix
    ../../modules/login.nix
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

  programs.fish.shellAliases = {
    rebuild = "doas nixos-rebuild switch --flake /etc/nixos#cappuccino";
  };

  cappuccino.enableLogin = true;

  programs.niri.enable = true;
}