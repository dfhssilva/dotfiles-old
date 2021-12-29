# dotfiles
dfhssilva's dotfiles

Versioning dotfiles for sync across environments

# Installation

1) Clone the repository to your local environment
2) Use [GNU Stow](https://www.gnu.org/software/stow/) to create the necessary symlinks of each dotfile to $HOME

# Miscellaneous

The misc folder contains miscellaneous dotfiles such as KDE shortcuts.

# Referencing Git Repositories
Third-party repositories are referenced using Git Subtrees. The main advantage is that users can access the nested repositories by only cloning this repository. On the other hand, updating subtrees needs to be done individually using a command like:
```bash
git subtree pull --prefix nvim/.config/nvim/ https://github.com/NvChad/NvChad.git main --squash
```

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

[Referencing One Git Repository from Another](https://www.pluralsight.com/guides/reference-one-git-repository-from-another)
