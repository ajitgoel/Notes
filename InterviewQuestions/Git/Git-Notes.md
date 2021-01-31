# Merging vs. Rebasing

## Conceptual Overview

The first thing to understand about `git rebase` is that it solves the same problem as `git merge`. ==Both of these commands are designed to integrate changes from one branch into another branch==—they just do it in very different ways.

Consider what happens when you start working on a new feature in a dedicated branch, then another team member updates the `master` branch with new commits. This results in a forked history, which should be familiar to anyone who has used Git as a collaboration tool.

<img src="C:\Users\ajitg\Notes\InterviewQuestions\Git\Untitled.assets\01.svg" alt="A forked commit history" style="zoom: 50%;" />

Now, let’s say that the new commits in `master` are relevant to the feature that you’re working on. To incorporate the new commits into your `feature` branch, you have two options: merging or rebasing.

### The Merge Option

The easiest option is to merge the `master` branch into the feature branch using something like the following:

```
git checkout feature git merge master
```

Or, you can condense this to a one-liner:

```
 git merge feature master
```

This creates a new “merge commit” in the `feature` branch that ties together the histories of both branches, giving you a branch structure that looks like this:

<img src="C:\Users\ajitg\Notes\InterviewQuestions\Git\Untitled.assets\02.svg" alt="Merging master into the feature branch" style="zoom:50%;" />

==Merging is nice because it’s a *non-destructive* operation. The existing branches are not changed in any way.==This avoids all of the potential pitfalls of rebasing (discussed below).

On the other hand, this also means that ==the `feature` branch will have an extraneous merge commit every time you need to incorporate upstream changes.== If `master` is very active, this can pollute your feature branch’s history quite a bit. While it’s possible to mitigate this issue with advanced `git log` options, it can make it hard for other developers to understand the history of the project.

### The Rebase Option

As an alternative to merging, you can rebase the `feature` branch onto `master` branch using the following commands:

```
git checkout feature git rebase master
```

==This moves the entire `feature` branch to begin on the tip of the `master` branch==, effectively incorporating all of the new commits in `master`. But, instead of using a merge commit, ==rebasing *re-writes* the project history by creating brand new commits for each commit in the original branch.==

<img src="C:\Users\ajitg\Notes\InterviewQuestions\Git\Untitled.assets\03.svg" alt="Rebasing the feature branch onto master" style="zoom:25%;" />

==The major benefit of rebasing is that you get a much cleaner project history.== First, it eliminates the unnecessary merge commits required by `git merge`. Second, as you can see in the above diagram, rebasing also results in a perfectly linear project history—you can follow the tip of `feature` all the way to the beginning of the project without any forks. This makes it easier to navigate your project with commands like `git log`, `git bisect`, and `gitk`.

But, there are two trade-offs for this pristine commit history: safety and traceability. If you don’t follow the [Golden Rule of Rebasing](https://www.atlassian.com/git/tutorials/merging-vs-rebasing#the-golden-rule-of-rebasing), re-writing project history can be potentially catastrophic for your collaboration workflow. And, less importantly, ==rebasing loses the context provided by a merge commit—you can’t see when upstream changes were incorporated into the feature.==