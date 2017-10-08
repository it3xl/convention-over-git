deletion_allowed=1

if [[ $deletion_allowed = 1 ]]; then
  not_existing_commit=0
  cd "$env_repo_1_path"
  git show $env_must_exist_commit &> /dev/null || not_existing_commit=1
  cd "$env_repo_2_path"
  git show $env_must_exist_commit &> /dev/null || not_existing_commit=1

  if [[ $not_existing_commit = 1 ]];
  then
    echo '!!!! Warning !!!! Deletion blocked. A "must exist commit" does not exist on both repos.'
    deletion_allowed=0
  fi
fi

if [[ $deletion_allowed = 1 ]]; then
  cd "$env_repo_1_path"
  lock_ref_1_repo1=$(git show-ref refs/heads/$env_must_exist_branch --hash) || true
  cd "$env_repo_2_path"
  lock_ref_1_repo2=$(git show-ref refs/heads/$env_must_exist_branch --hash) || true

  if [[ ( -z "$lock_ref_1_repo1" || "$lock_ref_1_repo1" != "$lock_ref_1_repo2") ]];
  then
    echo '!!!! Warning !!!! Deletion & recovering blocked. A "must exist branch" does not exist or not equal.'
    deletion_allowed=0
  fi
fi

if [[ $deletion_allowed = 1 ]]; then
  cd "$env_repo_1_path"
  repo1_refs=$(git show-ref --heads --tags | sort) || true
  cd "$env_repo_2_path"
  repo2_refs=$(git show-ref --heads --tags | sort) || true

  sorted_refnames_repo1=$(echo "$repo1_refs" | sed 's/^.* //' | sort)
  sorted_refnames_repo2=$(echo "$repo2_refs" | sed 's/^.* //' | sort)

  if [[ "$sorted_refnames_repo1" = "$sorted_refnames_repo2" ]];
  then
    echo 'Deletion & recovering disabled. All ref-names are the same.'
    deletion_allowed=0
  fi
fi


prune_expr=''
if [[ $deletion_allowed = 1 ]]; then
  prune_expr='--prune'
fi
