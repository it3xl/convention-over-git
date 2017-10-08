echo
cd "$env_repo_1_path"
echo $env_remote_1_key fetch
git fetch --prune "$env_repo_1_url" "${env_fetch_refspec[@]}"

echo
cd "$env_repo_2_path"
echo $env_remote_2_key fetch
git fetch --prune "$env_repo_2_url" "${env_fetch_refspec[@]}"
