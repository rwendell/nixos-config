# NixOS Configuration

My NixOS dotfiles managed via Home Manager + NixOS flake.

## Installation (nixos-anywhere)

Use [nixos-anywhere](https://github.com/nix-community/nixos-anywhere) to install to new machines:

```bash
# Install to remote machine via SSH
nix run github:nix-community/nixos-anywhere -- --flake github:yourusername/nixos-config#cappuccino user@target-host
```

## Local Development

```bash
# Build system configuration
sudo nixos-rebuild build --flake /etc/nixos#cappuccino
```

Available aliases:
- `nixos-switch` - build + switch
- `nixos-dark` - switch to dark theme (Kanso Zen)
- `nixos-light` - switch to light theme (Kanso Pearl)
- `nixos-update` - update flake inputs + switch
- `nixos-gen` - show current generation number

## Requirements

- NixOS with flakes enabled
- Home Manager
- Stylix theming
- Niri window manager

## Structure

```
.
├── flake.nix          # Flake inputs and NixOS config
├── flake.lock         # Flake lock file
├── home/               # Home Manager config
│   ├── default.nix     # Main home config
│   ├── stylix.nix      # Stylix theming targets
│   ├── niri.nix        # Niri window manager
│   └── ...
├── hosts/              # Host-specific configs
│   ├── shared.nix      # Shared across all hosts
│   └── cappuccino/    # ThinkPad T14 config
└── modules/           # Custom modules
    └── themes/         # Kanso theme definitions
```