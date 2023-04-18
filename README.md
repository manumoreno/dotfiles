# dotfiles

Work in progres...

## Neovim
* Using packer for plugin management. Will migrate to Lazy soon.
* While most lsps and plugins appear to be working fine they might need further tweaking (e.g. indent_blankline)
* Some plugin config files may not be in use. They are there because at some point I attempted to use them.

### jtdls
This is a somewhat tricky lsp to configure. After 3 failed attempts at setting this LSP up I was finally able to make it work.

Lessons learned:

1. Resist the temptation of installing binaries manually. Mason does a great job installing jdtls (as long as go is installed in your system).
2. The config file creates the workspace directory automatically.
3. Use the ```~/.config/nvim/ftplugin/java.lua``` config as the basis of your config and tweak as necessary. Be sure to test the values of the parameters at the top!
4. You can use this [Java style guide specification](https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml).
5. jtdls requires Java 17 or greater
6. Make sure your XDG directories are properly set up in your user environment.
Example:
```
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.local/cache
```

## Credits
It goes without saying, many snippets of code contained herein were found/borrowed from other people out there. Thank you!
