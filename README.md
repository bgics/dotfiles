# Dotfiles

Personal Nix configuration setup that works across NixOS, macOS, and any Linux distribution with the Nix package manager installed.

## Structure

### `flake.nix`
Main entry point defining the flake configuration with:
- **darwinConfigurations**: macOS configuration using nix-darwin
- **nixosConfigurations**: NixOS system configuration
- **homeConfigurations**: Home Manager configuration for WSL/other Linux distros

### `hosts/`
Platform-specific configurations:
- `mac/`: macOS host configuration
- `nixos/`: NixOS host configuration
- `wsl/`: WSL (Windows Subsystem for Linux) configuration

### `modules/`
Reusable Home Manager modules for:
- Shell configurations (bash, zsh, nushell)
- Terminal emulators (ghostty, wezterm)
- Development tools (git, direnv, helix)
- Editor setup (neovim with nvf)
- VLSI toolchain

### `neovim/`
Neovim configuration written using [nvf](https://github.com/notashelf/nvf) (NixVim Framework), including:
- LSP, autocomplete, and diagnostics
- Telescope, gitsigns, and harpoon
- Custom plugin configurations (nvim-tree, conform, vimtex, etc.)
- Gruvbox Material theme

### `vlsi/`
Custom Nix derivations for VLSI/EDA tools:
- **Magic**: VLSI layout tool
- **Xschem**: Schematic capture tool
- **Netgen**: LVS (Layout vs Schematic) tool
- **Xcircuit**: Circuit drawing program
- **Ngspice**: Circuit simulator (via module)
- **open_pdks**: Open-source Process Design Kits

### Other Configuration Files
- `starship.toml`: Starship prompt configuration
- `ghostty/`, `helix/`, `wezterm/`: Additional editor/terminal configs
- `wallpapers/`: Wallpaper assets

## Usage

### NixOS
```bash
sudo nixos-rebuild switch --flake .#nixos
```

### macOS
```bash
darwin-rebuild switch --flake .#mac
```

### Other Linux (via Home Manager)
```bash
home-manager switch --flake .#wsl
```
