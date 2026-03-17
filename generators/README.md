# Generator Module

## Random Generator (`randgen`)

A Go CLI tool to generate random strings, passwords, and UUIDs.

### Installation

```shell
cd "${WU_FOLDER}/wu/generators/randgen" && go build -o ~/.local/bin/randgen .
```

Ensure `~/.local/bin` is on your `$PATH`.

### Usage

```console
❯ randgen pwd 48
;Gdi^bk7Sq?v0!P]0,hLz4d<~DQ:1Q^IMH"#H-U6n^VFR"UT

❯ randgen alpha-num 16
jjOKQPXdRqFqu01c

❯ randgen number 10
8529847343

❯ randgen uuid
019cfb50-d2a4-7efd-8de9-2f4d6a18b6b1

❯ randgen uuidv4
a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d

❯ randgen uuidv7
019cfb50-d2a4-7efd-8de9-2f4d6a18b6b1
```

Default length for `pwd`, `alpha-num`, and `number` is **32** when not specified.

Add `--copy` / `-c` to any command to copy the result to the clipboard.
