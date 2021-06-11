# Pure Git with Convention over Git

Automated synchronization of remote Git repositories by pure Git and [Convention-over-Git](https://it3xl.blogspot.com/2017/09/convention-over-git.html).<br/>

### Consider to use [git-repo-sync](https://github.com/it3xl/git-repo-sync), the next generation of remote Git repositories synchronization solutions.

This approach uses well-known Git tools. It is because Git has an innate ability to do this. All we need to add is some convention.

## How to use

In a terminal (console) navigate to the project's root folder and run the script

`bash run.sh`

**Windows** users have to use Git Bash that comes with any Git installation.

In **sample_repos** folder, you will find prepared (emulated) local and remote repositories with some commits and branches.
Commit somthing or do a merge in any "local repository" and do the Git push.
Then run

`bash run.sh`

again to see changes migrated between remote repositories.

## Use in Production

Go to **repo_settings** folder and create there a file with your syncing repositories' settings.<br/>
Use **sample_repo.sh** file as an example.

Then run

`bash run.sh your_file_for_repo_settings.sh`

Repeat this run when you want to synchronize your remote repositories.

## What is this all about!

Convention over Git is a straightforward approach for an automatic synchronization between Git remote repositories.
Absolutely separate remote repositories will begin behave as a single remote repository.

This approach uses well-known Git tools. It is because Git has an innate ability to do this. All we need to add is some convention.

* [The main idea](https://it3xl.blogspot.com/2017/09/convention-over-git.html)
* [Day-to-day use or How-to](https://it3xl.blogspot.com/2017/09/convention-over-git-day-to-day-use.html)

Also you can see code explanation in [Cheat-sheet for implementation](https://it3xl.blogspot.com/2017/09/convention-over-git-impl-cheat-sheet.html)

## Glossary

[Glossary](https://it3xl.blogspot.com/2018/02/glossary-of-synchronization-of-remote.html)

## Features

* Synchronizations of git-tags was eliminated to allow GitLab block them freelly.
* It is impossible to delete branch of another side. Such branches will be restored.
* Auto conflict resolving by [Convention over Git](https://it3xl.blogspot.com/2017/09/convention-over-git.html) (non-fast-forward branch conflicts).
* Prevention of an occasional deletion of an entire repository.
* Failover & auto recovery of synchronization. Especially for network troubles.
* Solution is applied per-repository (vs per-server)
* It has been downgraded here to use two remote Git repositories for clarity, but it can work with many.
* Bare Git repositories are used for synchronization.

## Limitations

* Do only a single commit to another repository side per the synchronization interval.


