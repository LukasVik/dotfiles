#
# svn quick commands
#
alias sl="svn log --limit 6"
alias svngrep="grepr --exclude-dir=\".svn\""

# SVN status
function ss()
{
  if [ ${#} -eq 1 ]
  then
    # Specific revision
    svn diff --summarize -c ${1}
    return
  fi
  # No revision
  svn diff --summarize
}

# SVN diff (can specify files after on command line)
alias sd="svn diff --diff-cmd=\"meld\""

# SVN diff a specific revision
function sdr()
{
  if [ ${#} -eq 0 ]
  then
    echo "USAGE: sdr REVISION [FILES]"
    return
  fi
  svn diff --diff-cmd="meld" -c ${@}
}
