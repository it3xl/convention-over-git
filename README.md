# Convention-over-Git

Automated synchronization of remote Git repositories by pure Git and [Convention-over-Git](http://blog.it3xl.com/2017/09/convention-over-git.html).<br/>

It is proven and tested solution.

Consider to use more advanced [git-sinc](https://github.com/it3xl/git-sync) solution.

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

* [The main idea](http://blog.it3xl.com/2017/09/convention-over-git.html)
* [Day-to-day use or How-to](http://blog.it3xl.com/2017/09/convention-over-git-day-to-day-use.html)

Also you can see code explanation in [Cheat-sheet for implementation](http://blog.it3xl.com/2017/09/convention-over-git-impl-cheat-sheet.html)
