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

⌨️ Keymaps

```text
space w  ==> save file
Ctrl h  ==> Move to left window
Ctrl j  ==> Move to lower window
Ctrl k  ==> Move to upper window
Ctrl l  ==> Move to right window
Esc ==> clear search highlights or escape terminal mode depending on where it is used
Esc ==> escape terminal mode
space cr  ==> rename  variable
space tc  ==> change color scheme
space cl  ==> show the lsp config for all servers
gd ==> go to definition
gr ==> go to reference
gI ==> go to implementation
gy ==> go to type definition
gD ==> go to declaration
K ==> show doc for word under cusor
gK ==> show signature
space cd  ==> go to declaration
space fn  ==> new empty file
F1 ==> add the stdheader if in a c or h file else trigger the nvim help
space bd  ==> delete current buffer
space Ctrl  ==> trigger the blink auto complete to auto show on and off (consistent with the machine)
```

