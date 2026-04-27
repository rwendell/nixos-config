{ config, pkgs, inputs, ... }:
{
  programs.vicinae = {
    enable = true;
    systemd.enable = true;
    systemd.autoStart = true;
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        before_sleep_cmd = "hyprlock";
      };
      listeners = [
        {
          timeout = 300;
          on-timeout = "hyprlock";
          on-resume = "";
        }
      ];
    };
  };
}
