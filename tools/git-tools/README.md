# git-safe-push

## Description

This script is used to push the local changes to the remote repository safely. Instead of pushing directly into the main branch, creates a temporary branch that can be safely deleted after the changes are reviewed and merged. This way you don't have to keep many branches in your remote repository which means it's easier to keep a linear commit history ([Squash and Merge](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/about-pull-request-merges#squash-and-merge-your-commits) suggested for this aswell).

## Usage

Download the script and then add it to bin with the following commands:

```bash
sudo mv git-safe-push /usr/bin
sudo chmod +x /usr/bin/git-safe-push
```

Then you can use it like this:

```bash
git safe-push <remote> <branch> <-n|-e>
```
- `<remote>`: The remote repository to push to.
- `<branch>`: The branch to push to.
- `-n`: Pushes to a new branch.
- `-e`: Pushes to an existing branch.
