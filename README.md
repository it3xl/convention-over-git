# Convention-over-Git

This project stores a ready-to-use implementation of an idea of Convention-over-Git.

## The Announcement

An update is coming with some some bug fixing.
Also later I will publish an additiona project with significant performance considerations.

## How to use

In a terminal (console) navigate to the project's root folder and run the script<br/>
$ bash **run.sh**

**Windows** users have to use Git Bash that comes with any Git installation.

In a **sample_repos** folder, you will find prepared (emulated) local and remote repositories with some commits and branches.
Commit somthing or do a merge in the "local repositories" and do the Git push.
Then run<br/>
`$ bash **run.sh**`<br/>
again to see changes migrated between remote repositories.

## Use in Production

Go to **repo_settings** folder and create there a file with your syncing repositories settings.<br/>
Use **sample_repo.sh** file as an example.

Then run

$ bash **run.sh** your_file_for_repo_settings.sh

## What is this all about!

Convention over Git is a straightforward approach for an automatic synchronization between Git remote repositories.
Absolutely separate remote repositories will begin behave as a single remote repository.

This approach uses well-known Git tools. It is because Git has an innate ability to do this. All we need to add is some convention.

* [The main idea](http://blog.it3xl.com/2017/09/convention-over-git.html)
* [Day-to-day use or How-to](http://blog.it3xl.com/2017/09/convention-over-git-day-to-day-use.html)

Also you can see code explanation in [Cheat-sheet for implementation](http://blog.it3xl.com/2017/09/convention-over-git-impl-cheat-sheet.html)
