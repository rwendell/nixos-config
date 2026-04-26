{ config, lib, pkgs, ... }:
{
  options = {
    cappuccino.enableWireless = lib.mkEnableOption "wifi settings for cappuccino";
  };
  config = lib.mkIf config.cappuccino.enableWireless {
    networking.wireless.enable = true;
    networking.wireless.secretsFile = config.age.secrets.wifi.path;
    networking.wireless.networks."espresso".pskRaw = "ext:psk";
  };
}
