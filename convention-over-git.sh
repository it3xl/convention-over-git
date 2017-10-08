set -euf +x -o pipefail

echo Start `basename $0`

invoke_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$invoke_path"/set-env.sh "$@"


"$env_git_sync"/repo-create.sh "$env_repo_1_path"
"$env_git_sync"/repo-create.sh "$env_repo_2_path"


source "$env_git_sync"/changes-detector.sh


source "$env_git_sync"/fetching.sh


source "$env_git_sync"/deletion.sh


# Fast-forward sync, deletion, recovering of conventional refs
cd "$env_repo_1_path"
git push $prune_expr "$env_repo_2_url" "${env_push_repo1_sync_del_restore_refspec[@]}" || true
cd "$env_repo_2_path"
git push $prune_expr "$env_repo_1_url" "${env_push_repo2_sync_del_restore_refspec[@]}" || true


source "$env_git_sync"/fetching.sh


# Conventional refs conflicts resolving.
cd "$env_repo_1_path"
git push "$env_repo_2_url" "${env_repo1_conflict_resolving_push_refspec[@]}" || true
cd "$env_repo_2_path"
git push "$env_repo_1_url" "${env_repo2_conflict_resolving_push_refspec[@]}" || true


echo End `basename $0`
