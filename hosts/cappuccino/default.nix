{ config, pkgs, inputs, lib, ... }:

{
imports = [
    ../shared.nix
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen3
  ];

  boot.initrd.luks.devices."luks-99617911-0cdb-4012-b833-9b23bc548194".allowDiscards = true;
  boot.initrd.kernelModules = ["amdgpu"];

  networking.wireless.enable = true;
  networking.wireless.secretsFile = config.age.secrets.wifi.path;
  networking.wireless.networks."espresso".pskRaw = "ext:psk";

  networking.hostName = "cappuccino";

  programs.git.config.safe.directory = ["/etc/nixos"];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = "rwendell";
      };
    };
  };
}