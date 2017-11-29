# Set your values below

project_folder=sample_repo

export prefix_1=client_co
#export url_1=https://your-repo1-url.org/git/my_repo.git
export url_1="$path_git_sync/sample_repos/remote_$prefix_1"


export prefix_2=vendor_co
#export url_2=https://git.your-repo2-url.org/my_repo.git
export url_2="$path_git_sync/sample_repos/remote_$prefix_2"


# Some branch that must exist on both sides.
export must_exist_branch=$prefix_1/production



