#
# git quick commands
#
alias gut="git"
alias gti="git"
alias got="git"

alias ga="git add"
alias gap="git add -p"
alias gb="git branch -vv"
alias gd="git diff"
alias gdir="git difftool --dir-diff"
alias gf="git fetch --all"
alias gpo="git push origin"
alias gpof="gpo --force-with-lease"
alias gr="git remote -vv"
alias grb="git rebase"
alias gs="git -p status"
alias gx="git checkout"

alias sha="git rev-parse --verify --short HEAD"
alias smu="git submodule update --init --recursive"
alias amend="git commit -a --amend --no-edit"

alias log="git log --abbrev-commit --decorate -20 --date=format:'%Y-%m-%d %H:%M' --format=format:'%C(bold blue)%h%C(reset) - %C(dim green)%cd%C(reset) - %C(dim cyan)%an%C(reset) - %C(white)%s%C(reset) %C(bold yellow)%d%C(reset)'"
alias gll="git log --graph --oneline --decorate --branches"
alias gl="gll -20"
# git log verbose
alias glv="git log --graph --decorate --branches --stat"

function grbm
{
  # Git rebase master
  gf
  git rebase origin/master
}

function gxm
{
  # Git checkout master
  gf
  git checkout origin/master -B master
}

function commit()
{
  # Usage: commit My commit message header line
  message="${@}"
  git commit -a -m "${message}"
}

function wip()
{
  # Make a work-in-progress commit. With or without a describing commit message.
  if [ ${#} -eq 0 ]
  then
    message="WIP"
  else
    message="WIP: ${@}"
  fi
  commit "${message}"
}

function squash()
{
  # Make a "squash me" commit. With or without a describing commit message.
  if [ ${#} -eq 0 ]
  then
    message="SQUASH"
  else
    message="SQUASH: ${@}"
  fi
  commit "${message}"
}

function grbi()
{
  # Rebase, with or without commit argument.
  if [ ${#} -eq 0 ]
  then
    commit="origin/master"
  else
    commit=${1}
  fi
  git rebase -i ${commit}
}



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
