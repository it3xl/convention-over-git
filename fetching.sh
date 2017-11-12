echo

cd "$env_repo_1_path"
echo '@' fetch $env_remote_1_key
git fetch --prune "$env_repo_1_url" "${env_fetch_refspec[@]}"

cd "$env_repo_2_path"
echo '@' fetch $env_remote_2_key
git fetch --prune "$env_repo_2_url" "${env_fetch_refspec[@]}"
