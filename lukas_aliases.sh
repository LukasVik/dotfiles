# Aliases/settings that are specific for development environment on Lukas' computer.

#
# Directories
#
alias cdd="cd ~/work/repo/LukasVik/dotfiles"
alias cdw="cd ~/work/repo/LukasVik/lukasvik-io"
alias cda="cd ~/work/repo/LukasVik/marketing"

alias cdg="cd ~/work/repo/ghdl/ghdl"

alias cds="cd ~/work/repo/Sarcura/software"
alias cdm="cd ~/work/repo/Sarcura/software/external/hdl-modules/hdl-modules"
alias cdr="cd ~/work/repo/Sarcura/software/external/hdl-registers/hdl-registers"
alias cdt="cd ~/work/repo/Sarcura/software/external/tsfpga/tsfpga"
alias cdv="cd ~/work/repo/Sarcura/software/external/vunit/vunit"


#
# Quick command for opening VSCode workspace
#
alias cs="code ~/work/repo/Sarcura/software/sarcura.code-workspace"


#
# Set default simulator for scenarios where multiple simulators are installed and available on PATH.
#
export VUNIT_SIMULATOR="nvc"
