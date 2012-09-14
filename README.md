# Anthony’s dotfiles

## Installation

### Using the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/dotfiles`) The bootstrapper script will pull in the latest version and copy the files to your home folder.

To install, `cd` into your local `dotfiles` repository and then:

```bash
./bootstrap.sh
```

To update later on, just run that command again.

### Using custom colors

If you want to use this same repository (or a fork of it!) and you would like to tweak your server configuration without touching the base files, you can overwrite the defaults for the color settings:

```bash
cd .bash
cp bash_color_settings.orig bash_color_settings
```

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `~/utils` to the `$PATH`:

```bash
export PATH="$HOME/utils:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# PATH additions
export PATH="~/bin:$PATH"
```

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common Homebrew formulae (after installing Homebrew, of course):

```bash
./.brew
```

## Thanks to…
* [Mathias Bynens](https://github.com/mathiasbynens) The original author of the dotfiles repository! And all the people he thanks on that!
