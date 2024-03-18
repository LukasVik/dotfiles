#
# General
#
alias l="less"
alias ls="ls --color=auto --ignore=\"*~\""
alias s="ls"
alias ll="ls -lh"

alias amke="make"

alias c="code"

# Cat but with syntax highlighting, etc. https://github.com/sharkdp/bat
alias cat="bat"

alias grep="grep --line-number --with-filename --color"
alias grepr="grep -r"

alias py="python3"

# Reload shell config.
alias rc="source ~/.bashrc"


function snooze()
{
  # Run a command and send notification when it is done.
  if [ ${#} -eq 0 ]
  then
    echo "Need command argument"
    return 1
  fi
  "${@}"
  eval notify-send --expire-time 10000 \"Command done\" \"${@}\"
}


# Shorthand for 'browse' command, which is usually an alias for 'xdg-open'.
function b()
{
  if [ ${#} -eq 0 ]
  then
    # If no argument is given, browse current directory.
    browse .
  else
    # Otherwise, open the supplied file or folder.
    browse "${@}"
  fi
}


# Shorthand to create a file, add to git, and open it for editing.
function t()
{
  if [ ${#} != 1 ]
  then
    echo "Wrong argument count"
    return 1
  fi

  touch "${@}"
  git add "${@}"
  c "${@}"
}


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
# To get less noise from Vivado when running standalone
#
alias vivado="vivado -nojournal -nolog -notrace"


#
# FPGA development tools
#
num_threads_available=`\grep -c processor /proc/cpuinfo`

# Different repos have the simulate.py script in different locations.
# This function tries to find the location to be used in the alias functions belows.
function get_simulate_py_location()
{
  # First check the default location
  if [ -e "tools/simulate.py" ]
  then
    echo "tools/simulate.py"
    return
  fi

  # Otherwise use this location which is used in some repos
  echo "fpga_tools/simulate.py"
}

# Shorthand to run simulate.py with maximum amount of threads.
function sim()
{
  local simulate_py_location=$(get_simulate_py_location)

  py ${simulate_py_location} --num-threads ${num_threads_available} ${@}
}

# Shorthand to run simulate.py with maximum amount of threads and an output format that can be
# opened in gtkwave.
function simw()
{
  local simulate_py_location=$(get_simulate_py_location)

  py ${simulate_py_location} --num-threads ${num_threads_available} --gtkwave-fmt ghw ${@}
}

# Shorthand to run simulate.py and open result in GUI.
function simg()
{
  local simulate_py_location=$(get_simulate_py_location)

  py ${simulate_py_location} --num-threads ${num_threads_available} --gtkwave-fmt ghw --gui ${@} &
}

# Shorthand to run simulate.py with the inspect flag.
# Does not set maximum number of threads, since multiple matplotlib windows from different threads
# usually causes problems.
function simi()
{
  local simulate_py_location=$(get_simulate_py_location)

  py ${simulate_py_location} --inspect ${@}
}
