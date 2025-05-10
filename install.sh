#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"


# Clone wallpaper repo
mkdir -p ~/Pictures/walls/
git clone https://github.com/orangci/walls-catppuccin-mocha.git ~/Pictures/walls/catppuccin


echo "✅ DONE"

