# Powerlevel10k Theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Oh-My-Zsh
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 30
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"
CASE_SENSITIVE=false
HYPHEN_INSENSITIVE=true
COMPLETION_WAITING_DOTS="true"
plugins=(git z)
source $ZSH/oh-my-zsh.sh

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
function nvimvenv {
  if [[ -e "$VIRTUAL_ENV" && -f "$VIRTUAL_ENV/bin/activate" ]]; then
    source "$VIRTUAL_ENV/bin/activate"
    command nvim $@
    deactivate
  else
    command nvim $@
  fi
}
alias nvim=nvimvenv

# Set environment variables
export LANG=en_CA.UTF-8
export EDITOR='nvim'

# Custom aliases
alias zshrc="$EDITOR ~/.zshrc"

# Homebrew aliases
alias brewo="brew update && brew outdated --greedy"
alias brewu="brew upgrade --greedy && brew cleanup"
function brews() {
  local formulae="$(brew leaves | xargs brew deps --installed --for-each)"
  local casks="$(brew list --cask)"

  local blue="$(tput setaf 4)"
  local bold="$(tput bold)"
  local off="$(tput sgr0)"

  echo "${blue}==>${off} ${bold}Formulae${off}"
  echo "${formulae}" | sed "s/^\(.*\):\(.*\)$/\1${blue}\2${off}/"
  echo "\n${blue}==>${off} ${bold}Casks${off}\n${casks}"
}

# Audio
function flac_to_alac() {
  for i in *.flac; do 
    echo $i; 
    ffmpeg -i "$i" -y -v 0 -vcodec copy -acodec alac  "${i%.flac}".m4a && rm -f "$i"; 
  done
}

# Django
alias djrs="python manage.py runserver"
alias djmm="python manage.py makemigrations"
alias djm="python manage.py migrate"
function djsass() {
    sass --watch $1/static/sass:$1/static/css
}

alias luamake=/Users/bryanhill/lua-language-server/3rd/luamake/luamake

# LaTeX
alias tlmgr="sudo tlmgr"
