# More Practicing With Git

Some extra practic working with git.  Extension of the previous set of exercises. https://github.com/unh-comp-698-systems-software/git-practice

Author: dcouture (@MathYourLife)

## Setup

Clone this repo with either ssh or https.  Clone with ssh would use:

```bash
git clone git@github.com:unh-comp-698-systems-software/more-git-practice.git
```

All these exercises can be done with the local
copy of this repo, and should be pushed to your personal repo
when completed.

Create a new **empty** repo named "more-git-practice" in your personal github 
account (no README.md or License) that can receive your changes.  Then 
connect a remote to your personal repo.

```bash
git remote add my-repo [url for your repo]
```

You can push your changes once at the end, or as often as 
you'd like with:

```bash
# Push all your branches with
git push --all my-repo 
# Push all your tags with
git push --tags my-repo
```

Note: If you push, perform a squash, and push again, you'll get
an error since history was rewritten which can be overcome with
a forced push.

```bash
git push -f origin [branch that was rewritten]
```

## Exercises

1) Record your name in a feature branch

* Create a branch off of master called "feature".
* Add a file to this branch called "editor.txt" and enter your name.

2) Roll back time

A bad change was just released on the "scalping" branch at tag 1.4.1.  Modify is such that branch A now points to the 1.4.2. tag.

3) Merging

Changes from a peer made on branch "oversells" need to be merged into your branch "decentralized".  Make sure both of your content exists in branch "decentralized".

4) Merging two branches that both added the same file.

Two users working on branches "recriminated" and "angered" need to be merged, but both added the same file.  Merge branch "recriminated" into branch "angered" and keep just the content in branch "angered" for the conflicted file.

5) Merge two branches that both edit the same file.

Two users during the course of their work in branches "perkiness" and "sterilizer" have both edited an existing file (along with other changes).  Merge branch "perkiness" into branch "sterilizer" and for any conflicts include the content from both branches.

6) Undo a commit

Branch "picnickers" has a line of commits in them.  The changes made in the commit with the message "Undo this commit" need to be undone.  Use `git revert` to undo the changes of that one commit, and tag the fixed commit as 1.4.3.

Note: The same tag can only be added in one location since it's a pointer to 1 specific snapshot of your code.  If you made a mistake, you can delete a tag with

```bash
git tag -d 1.4.3
``` 

7) Push

Setup your personal repo as described above and publish your changes.

```bash
# Push all your branches with
git push --all my-repo 
# Push all your tags with
git push --tags my-repo
```
