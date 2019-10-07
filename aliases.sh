#
# General
#
alias l="less"
alias ls="ls --color=auto --ignore=\"*~\""
alias s="ls"
alias ll="ls -lh"
alias py="python"
alias amke="make"
alias rc="source ~/.bashrc"



#
# Directories
#
alias cc="cd .."
alias ccc="cd ../.."
alias cccc="cd ../../.."
alias ccccc="cd ../../../.."
alias cccccc="cd ../../../../.."
alias ccccccc="cd ../../../../../.."



#
# git quick commands
#
alias gut="git"
alias got="git"

alias branch="git branch -vv"
alias rebase="git rebase"
alias co="git checkout"
alias gx="git checkout"
alias gpo="git push origin"
alias gpof="gpo --force-with-lease"
alias gd="git diff"

alias stat="git -p status"
alias gs="stat"

alias sha="git rev-parse --verify --short HEAD"
alias smu="git submodule update --init --recursive"
alias amend="git commit -a --amend --no-edit"

alias log="git log --abbrev-commit --decorate --date=format:'%Y-%m-%d %H:%M' --format=format:'%C(bold blue)%h%C(reset) - %C(dim green)%cd%C(reset) - %C(dim cyan)%an%C(reset) - %C(white)%s%C(reset) %C(bold yellow)%d%C(reset)'"
alias gl="log"
alias gll="log"

alias rbmg="rbm && g"
alias ag="amend && g"


function remote
{
  # Get name of remote git server
  local server_name=$(git remote 2>/dev/null)
  echo -n ${server_name}
}


function fetch
{
  git fetch $(remote) 2>/dev/null
}


function g
{
  # Push to gerrit
  git push $(remote) HEAD:refs/for/master
}


function rbm
{
  # Rebase master
  fetch
  git rebase $(remote)/master
}


function com
{
  # Checkout master
  fetch
  git checkout $(remote)/master -B master
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


function squashb()
{
  # Checkout to a squash branch
  local branch_name=$(get_git_branch)
  git checkout -b ${branch_name}-squash
}


function rb()
{
  # Rebase, with or without commit argument.
  if [ ${#} -eq 0 ]
  then
    commit="HEAD~10"
  else
    commit=${1}
  fi
  git rebase -i ${commit}
}

