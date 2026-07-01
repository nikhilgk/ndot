# nvim

My Neovim config (a [LazyVim](https://www.lazyvim.org/) setup), tracked here so
it's identical on every machine.

## Install

Stowed like every other package (also wired into `basic.sh`):

```sh
cd ~/ndot && stow nvim   # symlinks ~/.config/nvim -> ndot/nvim/.config/nvim
```

## Reproducibility

`lazy-lock.json` pins every plugin to an exact commit, so a fresh machine gets
the same plugin versions. On first launch LazyVim installs the plugins listed
there into `~/.local/share/nvim/` (not tracked here). To sync versions after
pulling changes: open nvim and run `:Lazy restore`.

## System dependencies

LazyVim expects these on `PATH` (install via your distro / the tool's own
installer — versions from apt are often too old for Neovim):

- **neovim** >= 0.10
- **git**, a **C compiler** (gcc/clang) + **make** — for treesitter/plugins
- **node** (via nvm here) — LSP servers installed by Mason
- **ripgrep** (`rg`) and **fd** — telescope/snacks pickers
- **lazygit** — the git UI (`<leader>gg`)
- a **Nerd Font** in your terminal — for icons
