# Maid

Maid helps to clean unwanted traces the user leaves on the system.

## Install Nim

[Nim](https://nim-lang.org/) is a statically typed compiled systems programming language. It combines successful concepts from mature languages like Python, Ada and Modula.

## Build with Nim

### 1) Clone the repository

```sh
git clone https://github.com/gabrielcapilla/maid.git
```

### 2) Change dir to `maid`

```sh
cd maid
```

### 3 ) Install with `nimble`

```sh
nimble install
```

### 4) Uninstall

You can Uninstall `maid` just typing

```sh
nimble uninstall maid
```

## How to use

| Option | Description |
|---|---|
|`-c`, `--clear`| Run all available cleanups |
|`-sh`, `--history`| Clear Bash & Fish history|
|`-k`, `--clipboard`| Clean the clipboard|
|`-t`, `--thumbnails`| Delete cached thumbnails|
|`-h`, `--help`| Shows support |
|`-v`, `--version`| Displays the version|

### Examples

- Full cleaning

  ```sh
  maid --clear
  ```

- Delete only the history

  ```sh
  maid --history
  ```

- Clean clipboard & thumbnails

  ```sh
  maid --clipboard --thumbnails
  ```
