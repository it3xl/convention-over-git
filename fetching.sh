echo

cd "$path_1"
echo '@' fetch $prefix_1
git fetch --prune "$url_1" "${refspec_fetch[@]}"

cd "$path_2"
echo '@' fetch $prefix_2
git fetch --prune "$url_2" "${refspec_fetch[@]}"
