# Smart Attendance Tracker

## Steps to be followed for creating Pull Request
1. Fork 
2. Clone 
```sh
$ git clone https://github.com/YourUserName/attendanceApp.git
```
3. Move Directory
```sh
# This will change directory to a folder attendanceApp
$ cd attendanceApp
```
4.Set up
```sh
$ git remote -v
$ git remote add upstream https://github.com/akilvishnum/attendanceApp.git
```
5.Create Branch
```sh
#Create branch named "yourBranchName"
git checkout -b yourBranchName

#Move to branch "yourBranchName"
git checkout yourBranchName

git add .

git commit -m "Relevant Message"

git push -u origin yourBranchName

```

6. Sync
Run this to reflect any changes done in the main in your local repo
```sh
git fetch --all --prune

git checkout main

git reset --hard upstream/main

git push origin main
```

## Useful Links:
1. [Making Changes in your Repos](https://www.tutsmake.com/upload-project-files-on-github-using-command-line/)
2. [Making Changes in the Main Repo](https://galaxyproject.github.io/training-material/topics/contributing/tutorials/github-command-line-contribution/tutorial.html)

