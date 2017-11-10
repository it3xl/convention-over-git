
repo1_refs=$(git ls-remote --heads "$env_repo_1_url" $env_remote_1_key/* $env_remote_2_key/* | sort)
repo2_refs=$(git ls-remote --heads "$env_repo_2_url" $env_remote_1_key/* $env_remote_2_key/* | sort)

if [[ "$repo1_refs" = "$repo2_refs" ]];
then
  echo Refs are the same. Exit.
  
  exit
fi


repo1_prepared_refs=$(echo "$repo1_refs" | sed -r -e 's/\srefs\// /' -e 's/([^ ]+) +(.+)/\2 \t \1/' | sort)
repo2_prepared_refs=$(echo "$repo2_refs" | sed -r -e 's/\srefs\// /' -e 's/([^ ]+) +(.+)/\2 \t \1/' | sort)

echo
echo ------------------ Different refs: ----------------
comm -3 --output-delimiter= --nocheck-order <(echo "$repo1_prepared_refs") <(echo "$repo2_prepared_refs")
echo ___________________________________________________

echo


