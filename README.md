# Workstation Utils

Fully tested on MacOS with zsh.

## Installation

Clone the repository on your computer:

```shell
INSTALL_FOLDER="$HOME/wu"
git clone 'https://github.com/maximestevenot/wu' "$INSTALL_FOLDER/wu"
```

Add the following lines in your `.zshrc` or `.bashrc`...

```shell
source "${INSTALL_FOLDER}/wu/generators/random.sh"
source "${INSTALL_FOLDER}/wu/git-remote/generic.sh"
source "${INSTALL_FOLDER}/wu/git-remote/gitlab.sh"
```