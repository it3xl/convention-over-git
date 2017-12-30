
repo1_refs=$(git ls-remote --heads "$url_1" $prefix_1* $prefix_2*)
repo2_refs=$(git ls-remote --heads "$url_2" $prefix_1* $prefix_2*)

if [[ "$repo1_refs" = "$repo2_refs" ]];
then
  echo
  echo Refs are the same. Exit.
  
  exit
fi

changed_refs=$(awk -f "$path_git_sync/changed_refs.awk" <(echo "$repo1_refs"; echo "$repo2_refs"))



echo
echo ------------------ Changed refs: ------------------
echo "$changed_refs"
echo ___________________________________________________



