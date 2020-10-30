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
alias grep="grep --line-number --with-filename --color"
alias grepr="grep -r"
# Cat but with syntax highilighting, etc. https://github.com/sharkdp/bat
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
