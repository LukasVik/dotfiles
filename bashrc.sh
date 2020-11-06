
#
# If not running interactively, don't do anything
#
case $- in
  *i*) ;;
    *) return;;
esac


#
# Set the prompt
#
export PROMPT_COMMAND=__prompt_command

function __prompt_command() # Function run after every command
{
  local exit_code="${?}" # Last exit code (this needs to be first)
  local branch_name=$(get_git_branch)

  local reset_color='\[\e[0m\]' # Regular color
  local red='\[\e[1;31m\]' # Bold red
  local blue='\[\e[1;34m\]' # Bold blue


  #
  # Append last command to history
  #
  history -a


  #
  # Set the prompt
  #
  PS1="" # Reset

  # Set window title
  PS1="\[\e]0;\u@\h: \w\a\]"

  # Hostname/branch in prompt
  if [ -n "${branch_name}" ]; then
    PS1+=${branch_name}
  else
    # Not in a git repo. Use hostname instead.
    PS1+="\h"
  fi

  # Add warning message if last exit code not 0
  if [ ${exit_code} != 0 ]; then
    PS1+=" [${red}ERROR: ${exit_code}${reset_color}]"
  fi

  # Display path. Shorten if too long.
  local pwd_length=50
  local new_pwd="${PWD/#$HOME/~}"

  if [ $(echo -n ${new_pwd} | wc -c | tr -d " ") -gt ${pwd_length} ]
  then
    new_pwd=$(echo -n ${new_pwd} | awk -F '/' '{print $1 "/" $2 "/.../" $(NF-1) "/" $(NF)}')
  fi

  PS1+=" [${blue}${new_pwd}${reset_color}]"
  PS1+="\$ "
}

function current_directory_is_a_git_repo
{
  git rev-parse --is-inside-work-tree &>/dev/null
}


function get_git_branch
{
  if current_directory_is_a_git_repo
  then
    local branch=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD 2>/dev/null)
    if [ "$branch" == HEAD ]
    then
      # Show short sha id
      git rev-parse --verify --short HEAD 2>/dev/null
    else
      # Show name
      echo -n ${branch}
    fi
  fi
}


#
# Source the other files of this package
#
THIS_DIR=$(dirname ${BASH_SOURCE})
source ${THIS_DIR}/aliases.sh
source ${THIS_DIR}/git_commands.sh
source ${THIS_DIR}/svn_commands.sh



#
# Shell history
#
HISTCONTROL=ignoreboth:erasedups
HISTFILESIZE=1000000
HISTSIZE=1000000
shopt -s cmdhist
shopt -s histappend



#
# Path manipulation
#
# Locally built rust projects
PATH=~/.cargo/bin:${PATH}


#
# Misc settings
#
shopt -s globstar
shopt -s checkwinsize
bind "set bell-style none"


#
# Optional local configuration
#
if [ -e ~/.local_bashrc.sh ]
then
  source ~/.local_bashrc.sh
fi
