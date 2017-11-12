
echo Start `basename "$BASH_SOURCE"`

export env_repo_1_url="$env_git_sync/sample_repos/remote_$env_remote_1_key"
export env_repo_2_url="$env_git_sync/sample_repos/remote_$env_remote_2_key"

export env_repo_1_local="$env_git_sync/sample_repos/local_$env_remote_1_key"
export env_repo_2_local="$env_git_sync/sample_repos/local_$env_remote_2_key"

first_branch=$env_remote_1_key/production
second_branch=$env_remote_2_key/develop

export env_must_exist_branch=$first_branch


if [[ ! -f "$env_repo_1_url/config" ]]; then
  
  mkdir -p "$env_repo_1_url"
  cd "$env_repo_1_url"
  git init --bare
  git symbolic-ref HEAD refs/heads/$first_branch

  git clone "$env_repo_1_url" "$env_repo_1_local"
  cd "$env_repo_1_local"
  git checkout -b $first_branch
  touch .gitignore
  
  git add --all
  git commit -m "Initial commit"
  git branch $second_branch
  
  echo test file >> test_file.txt
  git add --all
  git commit -m "Test file commit"
  
  git push --all "origin"
  
  cp -r "$env_repo_1_url"/ "$env_repo_2_url"/
  cd "$env_repo_2_url"
  git symbolic-ref HEAD refs/heads/$second_branch
  
  git clone "$env_repo_2_url" "$env_repo_2_local"
  cd "$env_repo_2_local"

  echo other test file >> other_test_file.txt
  git add --all
  git commit -m "Other test file commit"
  git push --all "origin"

fi

echo End `basename "$BASH_SOURCE"`








