# maid

`maid` is a small and incredibly fast *cleaner* written fully in `nim👑` without any dependencies. Why `nim👑`? Because it's fast and simple. `maid` helps to clean unwanted traces the user leaves on the system. It can remove and clean out caches. `maid` helps to clean unwanted traces from Plasma and KDE applications users leave on the system.

## Installation

```sh
wget https://raw.githubusercontent.com/gabrielcapilla/maid/main/setup && sh setup
```

## Usage

```sh
maid [command]
```

Command  | Description
------------- | -------------
--help  | Displays available commands
--cache  | Clear __ALL__ the `~/.cache` folder
--version  | Show the version of the utility
--thumbnails  | Clears all cached thumbnails

## Build

## 1) Install [nim](https://nim-lang.org/)

### 2) Clone the repository

```sh
git clone https://github.com/gabrielcapilla/maid.git
```

### 3) Change dir to `maid`

```sh
cd maid
```

### 4) Build program with `nimble`

```sh
nimble build
```

Use `-d:release` to generate faster code

```sh
nimble -d:release build
```

After that you will get a ready-made binary file in the root directory of the project.

----

## TO-DO

- [ ] Clears the clipboard
- [x] Clears all cached thumbnails
- [x] Clear all the `~/.cache` folder
- [ ] Clears the history of commands run
- [ ] Clears the list of recently used documents
- [ ] Clears the list of recently used applications

### Others

- [ ] Better flags
- [ ] Multilingual support
