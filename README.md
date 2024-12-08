# .Dotfiles
My dotfiles, managed by [stow](https://www.gnu.org/software/stow/).
If after you stow a directory, you want to undo the stow,
repeat the same stow command,
except change the `-S` flag to a `-D` flag.


## Git
In the `.dotfiles` directory, do the following:
```
stow -vSt ~ git
```

## Helix
In the `.dotfiles` directory, do the following:
```
mkdir ~/.config/helix
stow -vSt ~/.config/helix helix
```

## Julia
In the `.dotfiles` directory, do the following:
```
mkdir ~/.julia  # Directory might already exist
stow -vSt ~/.julia julia
```

## Neovim
In the `.dotfiles` directory, do the following:
```
mkdir ~/.config/nvim  # Directory might already exist
cd nvim
stow -vSt ~/.config/nvim nvim
cd ..
```

## Zsh
In the `.dotfiles` directory, do the following:
```
stow -vSt ~ zsh
```
