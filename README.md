# Workstation Utils

Fully tested on MacOS with zsh.

## Installation

Clone the repository on your computer:

```shell
WU_FOLDER="$HOME/wu"
git clone 'https://github.com/maximestevenot/wu' "$WU_FOLDER/wu"
```

Add the following lines in your `.zshrc` or `.bashrc`...

```shell
source "${WU_FOLDER}/git-remote/generic.sh"
source "${WU_FOLDER}/git-remote/gitlab.sh"
```

Build and install the Go-based tools:

```shell
cd "${WU_FOLDER}/generators/randgen" && go build -o ~/.local/bin/randgen .
```

Ensure `~/.local/bin` is on your `$PATH`.
