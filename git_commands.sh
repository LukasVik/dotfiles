

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
