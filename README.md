# leetvim

A blazing-fast, Neovim configuration built for 1337 student use.

Leetvim minimizes bloat while providing a robust environment for C, Rust, bash, and Python. It relies on a flat, highly organized plugin structure and modern Neovim features to ensure rapid startup times and a seamless keyboard-driven workflow.

## ⚡ Features

* **Modern Plugin Stack:** Powered by cutting-edge plugins like `blink.cmp` for instant autocompletion, `snacks.nvim` for core utilities, and `mini.nvim` modules.
* **Flat Configuration Architecture:** Abandons deeply nested Lua directories. Core settings live in `lua/core/`, while individual plugins are configured neatly in the root `plugin/` directory for automatic sourcing and extreme maintainability.
* **Aesthetic & Ergonomic:** Features `lualine`, `luabufline`, and `smear_cursor` for a smooth, visually clean interface without sacrificing terminal performance.
* **Code Formatting:** Integrated `conform.nvim` and `nvim-lint` for seamless linting and formatting across languages, uses the norminette formatter for c and black for python to stay compliant with 42 project standards.

## 📁 Architecture

The repository is structured for modularity. Because plugins are stored directly in the `plugin/` directory, Neovim automatically sources them without requiring complex `require()` chains.

```text
leetvim/
├── init.lua(main entry point)
├── nvim-pack-lock.json(lock file for all the plugins)
├── lua/
│   └── core/
│       ├── auto_cmd.lua(every auto cmd)
│       ├── keymaps.lua(custom key maps as will be mentioned below)
│       └── options.lua(all the custom options)
└── plugin(hold all the plugins)
```

🛠️ Prerequisites

Ensure you have the following installed on your system:

*   Neovim (v0.10.0+ recommended)

*   Git & Make

*   Ripgrep (required for Telescope fuzzy finding)

*   Treesitter (for nvim treesitter)


🚀 Installation

```bash
    git clone https://github.com/otahiri/leetvim.git ~/.config/nvim
    nvim
```

## ⌨️ Hidden Dashboard Keymaps

To maintain a distraction-free startup screen, the dashboard features no visible menus. However, the following keybindings are silently active the moment you launch leetvim:

* `f` — Find a file in the current workspace (Telescope)
* `o` — Open previously accessed files (Telescope)
* `g` — Live grep for a string across the current directory (Telescope)
* `q` — Quit leetvim

## ⌨️ Keymaps

### General & Navigation
| Keybind | Action |
| :--- | :--- |
| `<Space> w` | Save current file |
| `<Ctrl> h/j/k/l` | Navigate between split windows |
| `<Esc>` | Clear search highlights (Normal mode) / Exit terminal mode |
| `<F1>` | Insert 42 `stdheader` (in `.c`/`.h` files) or open Neovim Help |

### Files & Buffers
| Keybind | Action |
| :--- | :--- |
| `<Space> fn` | Create a new empty file |
| `<Space> bd` | Delete the current buffer |
| `<Space> tc` | Change colorscheme |

### Telescope (Fuzzy Finding)
| Keybind | Action |
| :--- | :--- |
| `<Space> <Space>` | Find files in the current working directory |
| `<Space> fo` | Find previously opened files (Oldfiles) |
| `<Space> fg` | Live grep (Search for a string across the current directory) |
| `<Space> ff` | Search and switch between open buffers |
| `<Space> fc` | Search within `leetvim` configuration files |
| `<Space> fh` | Search Neovim help pages |

### LSP & Autocomplete
| Keybind | Action |
| :--- | :--- |
| `gd` | Go to Definition |
| `gD` / `<Space> cd` | Go to Declaration |
| `gr` | Go to References |
| `gI` | Go to Implementation |
| `gy` | Go to Type Definition |
| `K` | Show documentation for the word under the cursor |
| `gK` | Show function signature |
| `<Space> cr` | Rename variable across workspace |
| `<Space> cl` | Show active LSP server configurations |
| `<Space> <Ctrl>` | Toggle `blink.cmp` auto-completion behavior |

