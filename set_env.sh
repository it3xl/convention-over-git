echo
echo Start `basename "$BASH_SOURCE"`

[[ $# -eq 0 ]] && { echo The \"repo name\" parameter is empty. Exit.; exit 1; }

if [[ -n ${set_env_invoked+x} ]]; then
  echo '@ Already initialized'
else
  # The $invoke_path comes from an external script.
  export path_git_sync="$invoke_path"


  repo_key=$1
  
  
  export prefix_1=repo_1
  export prefix_2=repo_2

  if [[ 1 = 2 ]]; then
    # Set your values below and correct the above "if" to "[[ 1 = 1 ]]"
    
    export url_1=https://your-repo1-url.org/git/$repo_key.git
    export url_2=https://git.your-repo2-url.org/$repo_key.git
    
    # Some branch that must exist on both sides.
    export must_exist_branch=stand/prod
  else
    source "$invoke_path"/sample_init.sh
  fi

  export refspec_fetch=("+refs/heads/$prefix_1/*:refs/heads/$prefix_1/*" \
    "+refs/heads/$prefix_2/*:refs/heads/$prefix_2/*")

  export refspec_del_1=("refs/heads/$prefix_1/*:refs/heads/$prefix_1/*")
  export refspec_del_2=("refs/heads/$prefix_2/*:refs/heads/$prefix_2/*")

  export refspec_sync=("refs/heads/$prefix_1/*:refs/heads/$prefix_1/*" \
    "refs/heads/$prefix_2/*:refs/heads/$prefix_2/*")

  export refspec_solve_1=("+refs/heads/$prefix_1/*:refs/heads/$prefix_1/*")
  export refspec_solve_2=("+refs/heads/$prefix_2/*:refs/heads/$prefix_2/*")


  path_project_root="$path_git_sync/sync-repos/$repo_key"
  export file_must_exist_commit="$path_project_root/must_exist_commit.txt"
  export path_1="$path_project_root/sync/$prefix_1"
  export path_2="$path_project_root/sync/$prefix_2"
fi

export set_env_invoked=1


echo End `basename "$BASH_SOURCE"`
