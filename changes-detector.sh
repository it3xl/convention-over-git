
repo1_refs=$(git ls-remote --heads "$env_repo_1_url" $env_remote_1_key/* $env_remote_2_key/*)
repo2_refs=$(git ls-remote --heads "$env_repo_2_url" $env_remote_1_key/* $env_remote_2_key/*)

if [[ "$repo1_refs" = "$repo2_refs" ]];
then
  echo Refs are the same. Exit.
  
  exit
fi

changed_refs=$(awk -f "$env_git_sync/changed_refs.awk" <(echo "$repo1_refs"; echo "$repo2_refs"))



echo
echo ------------------ Changed refs: ----------------
echo "$changed_refs"
echo ___________________________________________________



