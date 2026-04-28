{ ... }:
{
  programs.niri.config = ''
    // Niri config inspired by Kanso Zen/Pearl theme (minimal mode)
    // Focus ring and border use same color for minimal feel

    // Prefer server-side decorations to avoid blue fill behind transparent windows
    prefer-no-csd

    // Programs (commented out if not installed)

    // Note: Environment variables should be set via home-manager or shell profile
    // XCURSOR_SIZE and HYPRCURSOR_SIZE are set in home-manager environment

    environment {
        QT_QPA_PLATFORM "wayland"
    }

    // Autostart commands
    spawn-at-startup "swww-daemon"
    spawn-at-startup "vicinae" "server"

    // Input configuration
    input {
        keyboard {
            xkb {
                layout "us"
                variant ""
                model ""
                options ""
                rules ""
            }
            repeat-delay 600
            repeat-rate 25
        }

        touchpad {
            natural-scroll
            tap
        }

        // Focus follows mouse
        focus-follows-mouse
    }

    // Layout configuration
    layout {
        gaps 5

        focus-ring {
            width 0;
            active-color "#505050";
            inactive-color "#505050";
        }

        border {
            width 0;
            active-color "#505050";
            inactive-color "#505050";
        }

        shadow {
            // Uncomment to enable shadows
            // on
            softness 4
            spread 0
            offset x=0 y=2
            draw-behind-window true
            color "#1a1a1aee"
        }

        // Blur support was added in niri 26.04
        // Uncomment when using a version that supports it
        // blur {
        //     on
        //     size 3
        //     passes 1
        // }

        struts {
            left -5
            right -5
            top -5
            bottom -5
        }
    }

    // Animations
    animations {
        // Uncomment to turn off all animations
        // off

        // Slow down all animations by this factor
        // slowdown 3.0

        // Individual animations - niri uses spring or easing curves
        window-open {
            duration-ms 150
            curve "ease-out-expo"
        }

        window-close {
            duration-ms 150
            curve "ease-out-quad"
        }

        horizontal-view-movement {
            spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }

        window-movement {
            spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }

        window-resize {
            spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }
    }

    // Window rules
    window-rule {
        match app-id="ghostty"
        opacity 0.8
    }

    // Disable background fill for transparent windows (fixes blue overlay)
    window-rule {
        match app-id="ghostty"
        draw-border-with-background false
    }

    // Keybindings
    binds {
        // Terminal
        Mod+Q { spawn "ghostty"; }

        // Close window
        Mod+C { close-window; }

        // Exit niri
        Mod+Shift+M { quit; }

        // File manager (nemo not installed - commented out)
        // Mod+E { spawn "nemo"; }

        // App launcher
        Mod+R { spawn "vicinae" "toggle"; }

        // Toggle floating
        Mod+V { toggle-window-floating; }

        // Screenshot (using niri built-in)
        Mod+Return { screenshot; }

        // Move focus with Mod + hjkl
        Mod+H { focus-column-left; }
        Mod+L { focus-column-right; }
        Mod+K { focus-window-up; }
        Mod+J { focus-window-down; }

        // Switch workspaces with Mod + [1-5]
        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }

        // Move active window to workspace with Mod + Shift + [1-5]
        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }
        Mod+Shift+4 { move-column-to-workspace 4; }
        Mod+Shift+5 { move-column-to-workspace 5; }

        // Scroll through workspaces with Mod + scroll
        Mod+WheelScrollDown cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollUp cooldown-ms=150 { focus-workspace-up; }

        // Resize windows
        Mod+Shift+L { set-column-width "+10%"; }
        Mod+Shift+H { set-column-width "-10%"; }
        Mod+Shift+K { set-window-height "-10%"; }
        Mod+Shift+J { set-window-height "+10%"; }

        // Mouse bindings for move/resize (built-in in niri)
        // Mod+MouseLeft is used for moving windows by default in niri
        // Mod+MouseRight is used for resizing windows by default in niri

        // Multimedia keys - Volume
        XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"; }
        XF86AudioMute allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
        XF86AudioMicMute allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }

        // Multimedia keys - Brightness
        XF86MonBrightnessUp allow-when-locked=true { spawn "brightnessctl" "s" "10%+"; }
        XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "s" "10%-"; }

        // Multimedia keys - Media player (playerctl not installed - commented out)
        // XF86AudioNext { spawn "playerctl" "next"; }
        // XF86AudioPause { spawn "playerctl" "play-pause"; }
        // XF86AudioPlay { spawn "playerctl" "play-pause"; }
        // XF86AudioPrev { spawn "playerctl" "previous"; }

        // Show keybind overlay
        Mod+Slash { show-hotkey-overlay; }
    }
  '';
}
