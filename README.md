# CRT retro terminal (Kitty + Hyprland) + LazyVim notes

Restore kit for the [Retro Terminals with Neovim + Kitty](https://www.youtube.com/watch?v=mMAy2YrevqE) experiment on hal3000.

## LazyVim (already in its own repo)

Catppuccin Mocha default + Avante Cursor ACP fixes live in:

- https://github.com/neg-c/lazyvim  
  Commits: `feat(theme): default LazyVim to Catppuccin Mocha`, `fix(mcp,avante): mcp login path, avante keybind update`

```bash
# if restoring LazyVim from scratch
git clone git@github.com:neg-c/lazyvim.git ~/.config/nvim
```

## Kitty (this repo)

Requires **kitty ≥ 0.49** for `custom_shaders`. System Arch package may still be 0.48 (ignores shaders). This machine uses the official binary:

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/kitty
ln -sf ~/.local/kitty.app/bin/kitten ~/.local/bin/kitten
```

Install config:

```bash
mkdir -p ~/.config/kitty/shaders
cp kitty/kitty.conf kitty/current-theme.conf ~/.config/kitty/
cp kitty/shaders/* ~/.config/kitty/shaders/
# open a NEW kitty: ~/.local/bin/kitty
```

Pipeline: `crt` → `tft` → custom `bezel` (`custom_shaders crt-retro`).

## Hyprland terminal bind (this repo)

Super+Return uses Kitty instead of foot:

```bash
cp hypr/lua/programs.lua ~/.config/hypr/lua/programs.lua
# or merge: programs.terminal = "/home/negc/.local/bin/kitty"
hyprctl reload
```

Foot remains for the file manager (`footclient yazi`).

## Toggle / revert

| Piece | Undo |
| --- | --- |
| CRT shaders | Comment `custom_shaders crt-retro` in `kitty.conf` |
| Kitty 0.51 | Remove `~/.local/bin/kitty` / `~/.local/kitty.app` |
| Terminal bind | Restore `programs.terminal = "footclient"` |
| Neovim theme | `<leader>uC` or reset `~/.local/state/nvim/colorscheme` |
