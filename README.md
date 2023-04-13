# .Dotfiles
My dotfiles

First, ensure you have `stow` installed.
Second, make sure you have `julia` installed and have entered the Julia REPL at least once
(so the `.julia/` directory is created).
Then, in the `.dotfiles` directoy, do the following.
```
stow -vSt ~ git
stow -vSt ~ zsh
stow -vSt ~/.julia julia
stow -vSt ~/.config helix
```

## Neovim
First ensure that the directory `~/.config/nvim/` exists.
Then `cd` into this directory, and in your terminal, enter
```
stow -vSt ~/.config/ nvim
```
