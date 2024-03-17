# .Dotfiles
My dotfiles

First, ensure you have `stow` installed.
Second, make sure you have `julia` installed and have entered the Julia REPL at least once
(so the `.julia/` directory is created).
Then, in the `.dotfiles` directoy, do the following.
```
mkdir .julia
mkdir ~/.config/nvim
mkdir ~/.config/zsh

stow -vSt ~ git
stow -vSt ~/.config helix
stow -vSt ~/.julia julia
stow -vSt ~/.config/nvim nvim
stow -vSt ~ zsh
```
