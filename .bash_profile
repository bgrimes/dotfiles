# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Use CLI colors, change the ls colors, set default editor
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=vim


# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
if [ -f `brew --prefix`/etc/bash_completion ]; then
	source `brew --prefix`/etc/bash_completion
fi


### BEGIN MY OLD .profile
# Java

[ -e /usr/libexec/java_home ] && export JAVA_HOME=`/usr/libexec/java_home 2&>/dev/null`

set -o vi
HISTFILESIZE=1000000000
HISTSIZE=1000000

######## Autocomplete Scripts
for completionFile in ~/.bash/completion/*; do
	source $completionFile
done

###### Aliases 
alias wget="wget --no-check-certificate" # Ignore invalid/poorly-signed ssh cert
alias grep="grep --color --exclude='*svn*'" # Grep Colors
alias tmux='tmux -2'
alias tx="tmuxinator start"
alias taildir="multitail --mergeall *"

####### PS1 Fixes
# Neat hack: http://jonisalonen.com/2012/your-bash-prompt-needs-this/
PS1="\[\033[G\]$PS1"
# Tmux powerline PWD setting: https://github.com/erikw/tmux-powerline
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'

export PATH
