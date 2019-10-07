BASHRC=/home/lukas/work/repo/dotfiles/bashrc.sh

if [ -e ${BASHRC} ]
then
  source ${BASHRC}
else
  echo "Bashrc file not available: ${BASHRC}"
fi

