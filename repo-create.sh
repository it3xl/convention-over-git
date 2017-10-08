
repo_path="$1"

if [[ -f "$repo_path/config" ]]; then
  exit
fi

mkdir -p "$repo_path"
cd "$repo_path"

git init --bare
