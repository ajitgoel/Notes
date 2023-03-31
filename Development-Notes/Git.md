**rollback all changes made by git rebase:**
git rebase --abort

**get the branch that you are currently on, the checked out files, staged files etc**
git status

**Merge changes from CR that is being reviewed into mainline branch**
cr-pull CR-80240895:4
Pick the commit id (of commit) from current branch. You can get that by doing 'git log'.
Switch branch to mainline by 'git checkout mainline'.
then cherry-pick your commit in mainline branch. 'git cherry-pick 'commit-id''.

**Delete a local branch in Intellij:**
- switch to mainline local branch
- delete non-mainline local branch 