#
# git quick commands
#
alias gut="git"
alias gti="git"
alias got="git"

alias ga="git add"
alias gap="git add --patch"

alias gb="git branch -vv"
alias gbr="gb --remotes"

alias gcm="git commit -m"

alias gcp="git cherry-pick"

alias gd="git diff"
alias gdir="git difftool --dir-diff"

alias gf="git fetch --all"

alias gpo="git push origin"
alias gpof="gpo --force-with-lease"

alias gr="git remote -vv"

alias grb="git rebase"

function grbm
{
  # Git rebase main
  gf || return 1
  git rebase origin/main
}

function grbi()
{
  # Rebase, with or without commit argument.
  if [ ${#} -eq 0 ]
  then
    commit="origin/main"
  else
    commit=${1}
  fi
  git rebase -i ${commit}
}

alias gs="git -p status"
alias gss="git show --stat"

alias gx="git checkout"

function gxm
{
  # Git checkout main
  gf || return 1
  git checkout origin/main -B main
}

function gxma
{
  # Git checkout master
  gf || return 1
  git checkout origin/master -B master
}

alias sha="git rev-parse --verify --short HEAD"

alias smu="git submodule update --init --recursive"

alias amend="git commit -a --amend --no-edit"

function gc()
{
  # Usage: commit My commit message header line
  message="${@}"
  git commit -a -m "${message}"
}

function gsq()
{
  # Make a "squash me" commit. With or without a describing commit message.
  if [ ${#} -eq 0 ]
  then
    message="SQUASH ME"
  else
    message="SQUASH ME: ${@}"
  fi
  gc "${message}"
}

function gdr()
{
  # Make a "drop me" commit. With or without a describing commit message.
  if [ ${#} -eq 0 ]
  then
    message="DROPME, shit commit"
  else
    message="DROPME, shit commit: ${@}"
  fi
  gc "${message}"
}

# Git log long.
# Formatting:
#  %h = abbreviated commit hash
#  %cd = committer date (format respects --date= option)
#  %aN = author name (respects .mailmap)
#  %d = ref names
#  %s = subject
alias gll="git log --graph --branches --date=format:'%Y-%m-%d %H:%M' --pretty='%C(yellow)%h %C(cyan)%cd %C(green)%aN%C(auto)%d %C(reset)%s'"
# Git log short, aka default.
alias gl="gll -20"
# git log verbose.
alias glv="git log --graph --branches --stat"


#
# Git tab completion
#

# Try to load tab-completion for git
if [ -f "/usr/share/bash-completion/completions/git" ]; then
    source /usr/share/bash-completion/completions/git
fi

# Set up tab-completion for aliases, if available
if $(type -t __git_complete > /dev/null)
then
    __git_complete ga _git_add
    __git_complete gap _git_add
    __git_complete gb _git_branch
    __git_complete gcp _git_cherry_pick
    __git_complete gd _git_diff
    __git_complete gf _git_fetch
    __git_complete gpo _git_push
    __git_complete gpof _git_push
    __git_complete grb _git_rebase
    __git_complete grbi _git_rebase
    __git_complete gx _git_checkout

    __git_complete log _git_log
    __git_complete gl _git_log
    __git_complete gll _git_log
fi
