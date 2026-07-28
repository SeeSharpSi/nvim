# Neovim configuration

Requires Neovim 0.11.3 or newer and Git. Optional tools used by mappings
include Sleek, tmux, and tmux-sessionizer.

Plugin versions are pinned in `lazy-lock.json`. Tree-sitter parsers are not
installed automatically; install reviewed parsers explicitly with
`:TSInstall`. Markdown Preview's npm dependencies are also opt-in; review its
`app/package-lock.json`, then run `npm ci --ignore-scripts` in the plugin's
`app` directory.

OpenCode mappings can submit the current buffer or selection to the provider
configured in OpenCode. Prompt mappings open a draft without automatically
submitting it so the context can be reviewed first.
