# dotfiles

Work in progres...

## Neovim
* Using packer for plugin management. Will migrate to Lazy soon.
* While most lsps and plugins appear to be working fine they might need further tweaking (e.g. indent_blankline)
* Some plugin config files may not be in use. They are there because at some point I attempted to use them.

### jdtls lsp server
This is a somewhat tricky lsp to configure. After 3 failed attempts at setting this LSP up I was finally able to make it work.

**Lessons learned:**

1. Resist the temptation of installing binaries manually. Mason does a great job installing jdtls (as long as go is installed in your system).
2. The config file creates the workspace directory automatically.
3. Use the ```~/.config/nvim/ftplugin/java.lua``` config as the basis of your config and tweak as necessary. Be sure to test the values of the parameters at the top! Particularly the ones shown below. (I'm using a Macbook!)
```
...
local lsp_server_path = jdtls_path .. "/config_mac"
local path_to_jar = jdtls_path .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
...
...
cmd = {
    '/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home/bin/java',
...
```
4. You can use this [Java style guide specification](https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml).
5. jtdls requires Java 17 or greater. Be sure your JAVA_HOME is set up correctly.
6. Make sure your XDG directories are properly set up in your user environment. E.g.
```
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.local/cache
```
7. One final thing, it would not hurt to add `$XDG_DATA_HOME/nvim/mason/packages/jdtls` to your PATH.

## Credits
It goes without saying, many snippets of code contained herein were found/borrowed from other people out there. Thank you!
