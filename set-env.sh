
echo Start `basename "$BASH_SOURCE"`

[[ $# -eq 0 ]] && { echo The \"repo name\" parameter is empty. Exit.; exit 1; }

if [[ -n ${set_env_git_sync+x} ]]; then
  echo '(git-sync)' Already initialized
else
  # The $invoke_path comes from an external script.
  export env_git_sync="$invoke_path"


  export env_repo_key=$1
  export env_workspace="$PWD"

  export env_remote_1_key=repo_1
  export env_remote_2_key=repo_2

  if [[ 1 = 2 ]]; then
    # Set your values below and correct the above "if" to "[[ 1 = 1 ]]"
    
    export env_repo_1_url=https://your-repo1-url.org/git/$env_repo_key.git
    export env_repo_2_url=https://git.your-repo2-url.org/$env_repo_key.git
    
    # Some branch that must exist on both sides.
    export env_must_exist_branch=stand/prod
    # Some commit that must exist on both sides.
    export env_must_exist_commit=eb6fd83632a9a3a9a40c4d060a1851dadb9dd9c6
  else
    source "$invoke_path"/sample-init.sh
  fi

  export env_fetch_refspec=("+refs/heads/$env_remote_1_key/*:refs/heads/$env_remote_1_key/*" \
    "+refs/heads/$env_remote_2_key/*:refs/heads/$env_remote_2_key/*")

  export env_push_repo1_sync_del_restore_refspec=("refs/heads/$env_remote_1_key/*:refs/heads/$env_remote_1_key/*")
  export env_push_repo2_sync_del_restore_refspec=("refs/heads/$env_remote_2_key/*:refs/heads/$env_remote_2_key/*")

  export env_repo1_conflict_resolving_push_refspec=("+refs/heads/$env_remote_1_key/*:refs/heads/$env_remote_1_key/*")
  export env_repo2_conflict_resolving_push_refspec=("+refs/heads/$env_remote_2_key/*:refs/heads/$env_remote_2_key/*")

  export env_all_repos_root_path="$env_git_sync/sync-repos"
  export env_repo_root_path="$env_all_repos_root_path/$env_repo_key"
  export env_repo_1_path="$env_repo_root_path/sync/$env_remote_1_key"
  export env_repo_2_path="$env_repo_root_path/sync/$env_remote_2_key"
fi

export set_env_git_sync=1


echo End `basename "$BASH_SOURCE"`
