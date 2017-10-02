# git unlock
Bash script to remove all locked refs in git.

### How it works
This script makes a pull comand to get all the locked refs, and then remove them using the command `git update-ref -d <refname>`

### Use *git unlock* as a custom command
Copy the script file to some location, like `C:/custom-commands`
Then execute this command: `git config --global alias.unlock '!<script-location-path>'`
Example: `git config --global alias.unlock '!C:/custom-commands'`
*Note:* use forward slashes in path

### How to use
Use like any other git command
```
$ git unlock
```