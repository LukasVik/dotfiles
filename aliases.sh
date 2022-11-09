#
# General
#
alias l="less"
alias ls="ls --color=auto --ignore=\"*~\""
alias s="ls"
alias ll="ls -lh"
alias py="python3"
alias amke="make"
alias rc="source ~/.bashrc"
alias grep="grep --line-number --with-filename --color"
alias grepr="grep -r"
# Cat but with syntax highlighting, etc. https://github.com/sharkdp/bat
alias cat="bat"

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



#
# Directories
#
alias cc="cd .."
alias ccc="cd ../.."
alias cccc="cd ../../.."
alias ccccc="cd ../../../.."
alias cccccc="cd ../../../../.."
alias ccccccc="cd ../../../../../.."

alias cdt="cd ~/work/repo/tsfpga/tsfpga"
alias cdm="cd ~/work/repo/hdl_modules/hdl_modules"
alias cdr="cd ~/work/repo/hdl_registers/hdl_registers"

alias cdv="cd ~/work/repo/vunit/vunit"

alias cde="cd ~/work/repo/truestream/embedded"
alias cdd="cd ~/work/repo/truestream/documents"
alias cdb="cd ~/work/repo/truestream/management"

alias cds="cd ~/work/repo/fpga-spelling/fpga-spelling"



#
# Quick command for opening VSCode workspace
#
alias codee="code ~/work/repo/truestream/embedded/embedded.code-workspace"



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
