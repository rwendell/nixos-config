{ config, pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          monitor = "";
          path = "/path/to/your/background.png"; # <-- Change to your wallpaper!
          blur = true;
        }
      ];
      input-field = [
        {
          size = "300 60";
          outline-thickness = 3;
          position = "0 80";
          monitor = "";
          fade-on-input = true;
          placeholder-text = "Password or fingerprint";
          input-method = "fingerprint";
        }
      ];
      # You can add clock, greeter, etc.
    };
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
