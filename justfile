all_cores := `case "$(uname -s)" in Linux) nproc;; Darwin) sysctl -n hw.logicalcpu;; esac`
build_cores := `printf "%.0f" "$(echo "$(case "$(uname -s)" in Linux) nproc;; Darwin) sysctl -n hw.logicalcpu;; esac) * 0.75" | bc)"`
current_hostname := `hostname -s`
current_username := `whoami`
backup_ext := `date +%Y%m%d-%H%M`

# List recipes
default:
    @just --list --unsorted

# Format files
format:
    @nix fmt

# Run nix repl and load flake
repl:
    @nix repl .

# Build OS and Home configurations
build:
    @just build-host

# Test OS and Home configurations
test:
    @just test-host

# Check OS and Home configurations
check:
    @nix flake check --show-trace

# Evaluate configurations without building
eval:
    @just eval-flake
    @just eval-configs

# Evaluate flake syntax and structure
eval-flake:
    @echo "Flake 󱄅 Evaluation: syntax and structure"
    @nix flake show --allow-import-from-derivation

# Switch OS and Home configurations
switch:
    @just switch-host

# Nix Garbage Collection
gc:
    @echo "Garbage 󰩹 Collection"
    nh clean all --keep 5

# Update flake.lock
update:
    @echo "flake.lock 󱄅 Updating "
    nix flake update

# Build OS configuration
build-host hostname=current_hostname:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "NixOS  Building: {{ hostname }}"
    nixos-rebuild build --flake $HOME/workspace/nix-config#{{ hostname }}

# Test OS configuration
test-host hostname=current_hostname:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "NixOS  Testing: {{ hostname }}"
    nixos-rebuild test --sudo --flake $HOME/workspace/nix-config#{{ hostname }}

# Switch OS configuration
switch-host hostname=current_hostname:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "NixOS  Switching: {{ hostname }}"
    nixos-rebuild switch --sudo --flake $HOME/workspace/nix-config#{{ hostname }}
