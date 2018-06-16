# Dotfiles

Clone the repo (use `--recursive` to download the submodules)

````
$ git clone --recursive https://github.com/sitilge/dotfiles
````

Assuming the project is under `~/Projects/dotfiles` then, for example, to install `nvim` run

````
$ cd ~/Projects/dotfiles && stow -t ~ nvim 
````

# Notes

- The `fonts` directory contains a font `Inconsolata Nerd Font Complete Mono.otf`. It is a patched font - it has both the original Inconsolata font and extra glyphs for powerline. After running the `stow` command, run `# fc-cache -vr` to cache the font. 
- As regards `termite`, the naming under `.config/termite/config` differs from the file name. The name of the font must be equal to the output of `$ fc-list | grep "Inconsolata" | cut -d ':' -f 2'` which, in this case, is slightly different from the actual font filename.
- There is no need to install any extra fonts for powerline, nvim, etc.
- Don't forget to set the correct locale. First, edit the `/etc/locale.gen` and uncomment the locale for example, `en_US.UTF-8`, then run `# locale-gen`, finally, run `# localectl set-locale LANG=en_US.UTF-8`.
- Edit the `.gitmodules` to cherry-pick repos you use.
- Run `$ nvim +UpdateRemotePlugins +qall` from the command line after updating nvim plugins or run `:UpdateRemotePlugins` from within nvim.
- To update all submodules run `$ git submodule update --remote --merge`
