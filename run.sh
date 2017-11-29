set -euf +x -o pipefail

echo
echo Start `basename $0`

invoke_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$invoke_path"/set_env.sh "$@"

echo
bash "$path_git_sync"/repo_create.sh "$path_1"
bash "$path_git_sync"/repo_create.sh "$path_2"


source "$path_git_sync"/changes_detector.sh


# Must use the source command here because it's impossible in bash to export array variables to subscripts.
source "$path_git_sync"/fetching.sh


source "$path_git_sync"/deletion.sh

if [[ $deletion_allowed = 1 ]]; then
  echo '@' 'Deletion (& partial recovering & sync)'
  cd "$path_1"
  git push --prune $url_2 "${refspec_del_1[@]}" || true
  cd "$path_2"
  git push --prune $url_1 "${refspec_del_2[@]}" || true


  source "$path_git_sync"/fetching.sh
fi


echo
echo '@ Sync & recovering. Fast-forward. Conventional refs'
cd "$path_1"
git push "$url_2" "${refspec_sync[@]}" || true
cd "$path_2"
git push "$url_1" "${refspec_sync[@]}" || true


source "$path_git_sync"/fetching.sh


echo
echo '@ Conflict resolving (conventional refs).'
cd "$path_1"
git push "$url_2" "${refspec_solve_1[@]}" || true
cd "$path_2"
git push "$url_1" "${refspec_solve_2[@]}" || true


echo End `basename $0`































