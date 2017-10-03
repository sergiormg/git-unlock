# git unlock
Bash script to remove locked refs in git.

### How it works
This script executes a `git fetch` comand to get all the locked refs, and then remove them using the command `git update-ref -d <refname>`

### How to use git unlock as a custom command
*git unlock* as a custom command
Copy the script file to some location, like:
```
C:/custom-commands/git-unlock.sh
```
Then execute this command to create a new alias in git for `git unlock` 
```
git config --global alias.unlock '!<script-location-path>'
```
Example:
```
git config --global alias.unlock '!C:/custom-commands/git-unlock.sh'
```

*Note:* use forward slashes in path

### How to use
Use it like any other git command
```
$ git unlock
```
