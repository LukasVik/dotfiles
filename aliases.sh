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
alias cdm="cd ~/work/repo/tsfpga/hdl_modules"
alias cdr="cd ~/work/repo/tsfpga/hdl_registers"
alias cdv="cd ~/work/repo/vunit/vunit"
alias cde="cd ~/work/repo/truestream/embedded"
alias cdd="cd ~/work/repo/truestream/documents"
alias cdb="cd ~/work/repo/truestream/management"


#
# Quick command for opening VSCode workspace
#
alias codee="code ~/work/repo/truestream/embedded/embedded.code-workspace"
