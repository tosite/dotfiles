# ghq list to peco
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^l' peco-src

# select git branch and git checkout
function peco-branch () {
  local selected_branch=$(\git branch | peco --query "$LBUFFER")
  if [ -n "$selected_branch" ]; then
    BUFFER="git checkout ${selected_branch}"
    zle accept-line
  fi
  zle accept-line
}

zle -N peco-branch
bindkey '^b' peco-branch