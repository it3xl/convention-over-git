
echo

deletion_allowed=1

if [[ $deletion_allowed = 1 ]]; then
  cd "$path_1"
  lock_ref_1_repo1=$(git show-ref refs/heads/$must_exist_branch --hash) || true
  cd "$path_2"
  lock_ref_1_repo2=$(git show-ref refs/heads/$must_exist_branch --hash) || true

  if [[ ( -z "$lock_ref_1_repo1" || "$lock_ref_1_repo1" != "$lock_ref_1_repo2") ]]; then
    echo '@' '!!!! Deletion & recovering blocked'
    echo '@' '!!!! "Must exist branches" do not exist or not equal.'
    echo '@' '!!!! ' $must_exist_branch

    deletion_allowed=0
  fi
fi

if [[ $deletion_allowed = 1 ]]; then
  if [[ ! -f "$file_must_exist_commit" ]]; then
    cd "$path_1"
    git show-ref refs/heads/$must_exist_branch --hash > "$file_must_exist_commit" || true
  fi
  read -r must_exist_commit < "$file_must_exist_commit" || true
  if [ -z ${must_exist_commit+x} ]; then
    must_exist_commit=""
  fi

  not_existing_commit=0
  cd "$path_1"
  git show $must_exist_commit &> /dev/null || not_existing_commit=1
  cd "$path_2"
  git show $must_exist_commit &> /dev/null || not_existing_commit=1

  if [[ $not_existing_commit = 1 ]]; then
    echo '@' '!!!! Deletion & recovering blocked'
    echo '@' '!!!! A "must exist commit" does not exist on both repos.'
    echo '@' '!!!! ' must_exist_commit = '"'$must_exist_commit'"'
    
    deletion_allowed=0
  fi
fi

if [[ $deletion_allowed = 1 ]]; then
  cd "$path_1"
  repo1_refs=$(git show-ref --heads | sort) || true
  cd "$path_2"
  repo2_refs=$(git show-ref --heads | sort) || true

  sorted_refnames_repo1=$(echo "$repo1_refs" | sed 's/^.* //' | sort)
  sorted_refnames_repo2=$(echo "$repo2_refs" | sed 's/^.* //' | sort)

  if [[ "$sorted_refnames_repo1" = "$sorted_refnames_repo2" ]]; then
    echo '@' 'Deletion & recovering disabled. All ref-names are the same.'
    
    deletion_allowed=0
  fi
fi



