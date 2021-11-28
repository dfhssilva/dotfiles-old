# dotfiles
DavidSilva98's dotfiles

Versioning dotfiles for sync across environments

# Installation

1) Clone the repository to your local environment
2) Use [GNU Stow](https://www.gnu.org/software/stow/) to create the necessary symlinks of each dotfile to $HOME

# NeoVim

The NeoVim dotfiles depend on the [NvChad](https://github.com/NvChad/NvChad) configurations. Follow installation instructions [here](https://nvchad.github.io/getting-started/setup).

# Examples
Create symlinks for the config files:
```bash
cd ~/dotfiles
stow bash  # bash config symlinks
stow zsh  # zsh config symlinks
stow conda  # conda config symlinks
```

# References

[Move your dotfiles to version control](https://opensource.com/article/19/3/move-your-dotfiles-version-control)

[Using GNU Stow to manage your dotfiles](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
