##############################################################################
### Powerlevel10k Theme
### To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
##############################################################################
P10K="$ZDOTDIR/p10k/p10k.zsh"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f "$P10K" ]] || source $P10K

# Z - https://github.com/agkozak/zsh-z
export ZSHZ_DATA="$ZDOTDIR/z/.z"

# Oh-My-Zsh
# https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#main-settings
export ZSH="$ZDOTDIR/oh-my-zsh"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 30
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"
CASE_SENSITIVE=false
HYPHEN_INSENSITIVE=true
COMPLETION_WAITING_DOTS="true"
plugins=(git z)
source $ZSH/oh-my-zsh.sh

##############################################################################
### Pyenv
### https://github.com/pyenv/pyenv?tab=readme-ov-file#set-up-your-shell-environment-for-pyenv
### https://github.com/pyenv/pyenv-virtualenv?tab=readme-ov-file#installing-with-homebrew-for-macos-users
### https://github.com/pyenv/pyenv?tab=readme-ov-file#homebrew-in-macos
##############################################################################
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null && eval "$(pyenv init -)"
command -v pyenv-virtualenv >/dev/null && eval "$(pyenv virtualenv-init -)"
command -v pyenv >/dev/null && alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

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


##############################################################################

# Set environment variables
export LANG=en_CA.UTF-8
export EDITOR='nvim'

# Custom aliases
alias zshrc="$EDITOR $ZDOTDIR/.zshrc"

# Homebrew aliases
alias brewo="brew update && brew outdated"
alias brewu="brew upgrade && brew cleanup"
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

# ffmpeg
alias ffmpeg="ffmpeg7"

# Audio
# function flac_to_alac() {
#   for i in **/*.flac; do
#     echo $i;
#     ffmpeg -i "$i" -y -v 0 -c:v copy -acodec alac "${i%.flac}".m4a && rm -f "$i";
#   done
# }
function wav_to_alac() {
  for i in *.wav; do
    echo $i;
    ffmpeg -i "$i" -y -v 0 -c:v copy -acodec alac "${i%.wav}".m4a && rm -f "$i";
  done
}
function wav_to_flac() {
  for i in *.wav; do
    echo $i;
    ffmpeg -i "$i" -y -v 0 -c:v copy -acodec flac "${i%.wav}".flac && rm -f "$i";
  done
}
function alac_to_flac() {
  for i in *.m4a; do
    echo $i;
    ffmpeg -i "$i" -y -v 0 -c:v copy -acodec flac "${i%.m4a}".flac && rm -f "$i";
  done
}
function flac_to_mp3() {
  for i in *.flac; do
    echo $i;
    ffmpeg -i "$i" -y -v 0 -c:v copy -b:a 320k "${i%.flac}".mp3 && rm -f "$i";
  done
}
function alac_to_mp3() {
  for i in *.m4a; do
    echo $i;
    ffmpeg -i "$i" -y -v 0 -c:v copy -b:a 320k "${i%.m4a}".mp3 && rm -f "$i";
  done
}
function wav_to_mp3() {
  for i in *.wav; do
    echo $i;
    ffmpeg -i "$i" -y -v 0 -c:v copy -ab 320k "${i%.wav}".mp3 && rm -f "$i";
  done
}
function alac_to_wav() {
  for i in *.m4a; do
    echo $i;
    ffmpeg -i "$i" -v 0 "${i%.m4a}".wav && rm -f "$i";
  done
}
function flac_to_aac() {
  for i in **/*.flac; do
    echo $i;
    flac -d -f -s -o tmp.wav "$i" \
    && afconvert tmp.wav tmp.caf -d 0 -f caff --soundcheck-generate \
    && afconvert tmp.caf -d aac -f m4af -u pgcm 2 --soundcheck-read -b 192000 -q 127 -s 2 "${i%.flac}".m4a \
    && rm "$i";
  done
  rm -f tmp.wav;
  rm -f tmp.caf;
}
function flac_to_alac() {
  for i in **/*.flac; do
    echo $i;
    flac -d -f -s -o tmp.wav "$i" \
    && afconvert tmp.wav -d alac -f m4af "${i%.flac}".m4a \
    && rm "$i";
  done
  rm -f tmp.wav;
}
function m4a_to_flac() {
  for i in **/*.m4a; do
    echo $i;
    ffmpeg -i "$i" -v 0 -acodec flac "${i%.m4a}".flac \
    && flac --best --verify --silent --force "${i%.m4a}".flac \
    && rm "$i";
  done
}

function flac_list_meta() {
  for i in **/*.flac; do
    metaflac --list --except-block-type=PICTURE "$i";
  done
}
function flac_remove_padding() {
  for i in **/*.flac; do
    echo $i;
    metaflac --dont-use-padding --remove --block-type=PADDING "$i";
  done
}

# Django
alias djrs="python manage.py runserver"
alias djmm="python manage.py makemigrations"
alias djm="python manage.py migrate"
function djsass() {
    sass --watch $1/static/sass:$1/static/css
}

# LaTeX
alias tlmgr="sudo tlmgr"

# ImageMagick
export PATH="/opt/local/lib/ImageMagick7/bin:$PATH"




##############################################################################
### Julia
##############################################################################

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/byhill/.julia/juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

##############################################################################
### POSTGRESQL
##############################################################################
export PATH="/Library/PostgreSQL/17/bin:$PATH"
##############################################################################

# sudo pmset -a disablesleep 1
