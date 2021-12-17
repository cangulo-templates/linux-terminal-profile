# linux-terminal-profile

## How to use this template out of the box

1. Clone this repo locally
2. Add the most used directories to [bookmarks.json](bookmarks.json) 
3. Update the variables in the [settings.json](settings.json). Add there any environment variable you would like to have available during all the session
4. Extend the next files with aliases and functions you need:
   1. [functions.sh](scripts/functions.sh)
   2. [aliases-bash.sh](scripts/aliases-bash.sh)
   2. [aliases-zsh.sh](scripts/aliases-zsh.sh)
5. Update `PROFILE_REPO_PATH` in the following code 

```bash
export PROFILE_REPO_PATH='/home/cangulo/repos/cangulo-templates/linux-terminal-profile/'
source $PROFILE_REPO_PATH/load-custom-profile.sh
```

5. Append the previous code in your [profile terminal file](#terminal-profile-files)
6. Open your terminal and test it!

## Are you going to use this on more than one computer?

I recommend you to follow a similar approach:

1. Fork this repo
2. Instead of using the files mentioned before, duplicate and rename them to `NAME.local.json` files:
  * [bookmarks.json](bookmarks.json) -> bookmarks.local.json
  * [settings.json](settings.json)   -> settings.local.json
3. Add a `.gitignore` file, append there the local files:

```bash
bookmarks.local.json
settings.local.json
```

4. Reference local files in [load-custom-profile.sh](load-custom-profile.sh). Look for the `JSON FILES` section

```BASH
#   JSON FILES
export SETTINGS_FILE="$PROFILE_REPO_PATH/settings.local.json"
export BOOKMARKS_FILE="$PROFILE_REPO_PATH/bookmarks.local.json"
```

5. Extend the next files with aliases and functions you need:
   1. [functions.sh](scripts/functions.sh)
   2. [aliases-bash.sh](scripts/aliases-bash.sh)
   3. [aliases-zsh.sh](scripts/aliases-zsh.sh)
6. In order to keep the template updated for your needs, changes in `settings.local.json` should be replicated in `settings.json` and pushed.
* `settings.local.json`: local environment variables, NOT PUSHED TO THE REPO
* `settings.json`: template stored in the repo, used when importing it in new computers

## Terminal Profile files

* Default bash script `$HOME/.bashrc` 
* [zsh](https://ohmyz.sh) `$HOME/.zshrc` for zsh 

# Requirements

* Linux Terminal: Bash or [zsh](https://ohmyz.sh).


# Author

Carlos Angulo
https://cangulo.github.io