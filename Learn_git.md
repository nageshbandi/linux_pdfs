# Learning Git
#Git log command help to list latest commits output\
`git log`

#You can list the changed files as well using the --name-only option with the git log command Run the command\
`git log --name-only`

#What is the option for git log command to display the logs in compact way (one log per line)?\
`git log --oneline`

#The repository has many commits. Can you try to list the last 3 commits alone?\
`git log -3`

#Create new branch\
`git branch new_branch_name`

#switch to a existing branch\
`git checkout branch_name`

#Create new git branch and checkout at a time\
`git checkout -b new_branch_name`

#Delete a git branch\
`git branch -d branch_name`

#List All branches\
`git branch `

#To see previous commit history along with the branch they were committed on.\
`git log --graph --decorate`

#Adding a remote repository, The git remote add command takes two arguments:
A remote name, for example, origin
A remote URL, for example, https://github.com/user/repo.git\
`git remote add origin https://github.com/USER/REPO.git`

#To list all remote repositories on git\
`git remote -v`

#Code push 
`git push origin master` # here origin is the remote repo alias name 

#Incase we wat to push the code with fast-forwarded need to use -f option\
`git push -f origin master `

#
