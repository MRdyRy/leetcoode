#!/usr/bin/env sh
set -eu

# Simple non-interactive installer for rustup + stable toolchain.
# Usage: sh scripts/install-rust.sh

command -v rustup >/dev/null 2>&1 && {
  echo "rustup is already installed: $(rustup --version)"
  echo "Ensuring stable toolchain is installed..."
  rustup toolchain install stable || true
  echo "Done."
  exit 0
}

echo "Installing rustup (non-interactive)..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Load cargo env for current shell if possible
if [ -f "$HOME/.cargo/env" ]; then
  # shellcheck disable=SC1090
  . "$HOME/.cargo/env"
fi

echo "Installing stable toolchain..."
rustup toolchain install stable

echo "Rust installation complete."
echo "Run 'rustc --version' and 'cargo --version' to verify."
