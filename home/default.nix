{inputs, config, pkgs, ...} :

{
  imports = [
    ./stylix.nix
    ./niri.nix
    inputs.nixvim.homeModules.nixvim
    inputs.agenix.homeManagerModules.default
    inputs.zen-browser.homeModules.beta
    ./lock-screen.nix
    ./nixvim
  ];

  programs.nixvim.enable = true;

  programs.zen-browser = {
    enable = true;
    profiles.default = {
      settings = {
        "browser.tabs.allow_transparent_browser" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      userChrome = ''
        /* Fix active tab text contrast - force dark text on light highlight */
        .tabbrowser-tab[selected] .tab-label,
        tab[visuallyselected="true"] .tab-label,
        .tab-label[selected="true"] {
          color: #090E13 !important;
          font-weight: 600 !important;
        }

        /* Fix inactive tab text to be lighter */
        .tabbrowser-tab:not([selected]) .tab-label {
          color: #c5c9c7 !important;
        }

        /* Fix new tab popup - site names */
        #newtab-popup .site-name,
        #newtab-popup .tab-context-line,
        .popup-notification-description {
          color: #c5c9c7 !important;
        }

        /* Fix new tab popup background */
        #newtab-popup,
        #tabContextMenu {
          background-color: #090E13 !important;
          color: #c5c9c7 !important;
        }

        /* Fix URL bar popup */
        #urlbar-results,
        #urlbarView-results {
          background-color: #090E13 !important;
          color: #c5c9c7 !important;
        }

        /* Fix search bar contrast */
        #urlbar-input,
        #searchbar input {
          color: #c5c9c7 !important;
        }

        /* Fix toolbar items contrast */
        .toolbarbutton-1,
        #back-button,
        #forward-button,
        #reload-button {
          color: #c5c9c7 !important;
        }
      '';
      userContent = ''
        /* Force white background on sites that don't specify it */
        html:not([data-theme="dark"]):not(.dark-theme) {
          background-color: white !important;
          color: black !important;
        }
      '';
    };
  };

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
    "darkman/dark-mode.d/nixos-switch" = {
      text = ''
        #!/bin/sh
        exec /run/current-system/sw/bin/nixos-rebuild switch --specialisation dark --flake /etc/nixos#cappuccino
      '';
      executable = true;
    };
    "darkman/light-mode.d/nixos-switch" = {
      text = ''
        #!/bin/sh
        exec /run/current-system/sw/bin/nixos-rebuild switch --specialisation light --flake /etc/nixos#cappuccino
      '';
      executable = true;
    };
  };

  home.stateVersion = "26.05";
}
