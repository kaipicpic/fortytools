#!/bin/bash

set -e

REPO_URL="https://kaipicpic.github.io/fortytools"
INSTALL_DIR="$HOME/fortytools"
SCRIPTS=(
  feval
)

echo "[*] Installing FortyTools to $INSTALL_DIR..."

mkdir -p "$INSTALL_DIR"

for script in "${SCRIPTS[@]}"; do
    echo " - Downloading $script..."
    curl -fsSL "$REPO_URL/scripts/$script" -o "$INSTALL_DIR/$script"
    chmod +x "$INSTALL_DIR/$script"
done

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> ~/.bashrc
    echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> ~/.zshrc
    echo "[+] Added $INSTALL_DIR to PATH."
    echo "[!]  Restart your terminal."
else
    echo "[✓] $INSTALL_DIR is already in PATH."
fi

echo "[✔] FortyTools installed successfully!"
