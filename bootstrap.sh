#!/bin/bash
LINKEDDIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git pull
function doIt() {
	ls -a | grep -v -e"^\.$" -e"^\.\.$" -e"\.git" -e"README\.md" -e"bootstrap\.sh" -e"\.DS_Store" | xargs -I {} ln -f -s $LINKEDDIR/{} ~/{}
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile
