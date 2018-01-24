# Dotfiles

An array of dotfiles.

# Install

GNU Stow is the preferred method. Assume that the project is under `~/Projects/dotfiles` then, for example, to install `nvim` run

````
cd ~/Projects/dotfiles && stow -t ~ nvim 
````

# Notes

- The `fonts` directory contains a font `Inconsolata Nerd Font Complete Mono.otf`. It is a patched font - it contains both the original Inconsolata and extra glyphs for powerline. After running the `stow` command, run `fc-cache -vr` to cache the font. 
- As regards `termite`, the naming under `.config/termite/config` differs from the file name. The name of the font must be equal to the output of `fc-list | grep "Inconsolata" | cut -d ':' -f 2' which, in this case, is slightly differnet from the actual font filename.
- There is no need to install any extra fonts for powerline, nvim, etc.
