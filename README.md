# leetcoode

## GitHub Codespaces / Devcontainer: Rust setup

This repository includes a `.devcontainer` configuration that installs rustup and the stable Rust toolchain when you create or rebuild a GitHub Codespace.

Steps to use:

1. Open this repository in GitHub Codespaces or open it in VS Code and "Reopen in Container".
2. The container uses the `devcontainers/features/rust` feature to install `rustup` and the `stable` toolchain.
3. After the Codespace is provisioned, verify Rust is available:

```bash
rustup --version
rustc --version
cargo --version
```

Fallback manual install (if something goes wrong):

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup toolchain install stable
```

If you add or change the `.devcontainer` files, rebuild the container to apply changes: "Codespaces: Rebuild Container" or in VS Code use the Command Palette -> Dev Containers: Rebuild Container.

Simple local install script
---------------------------

If you'd like to install rustup and the stable toolchain manually inside the container or on a local machine, a small helper script is provided:

```bash
sh scripts/install-rust.sh
```

The script is non-interactive and will:
- skip installation if `rustup` is already present (but will ensure the `stable` toolchain is installed),
- otherwise run the official rustup installer non-interactively and install the `stable` toolchain.
