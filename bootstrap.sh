#!/bin/bash
LINKEDDIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUPFOLDER=~/backup-dotfiles-`date +%s`

git submodule init
git submodule pull
git pull
function doIt() {
	dotfiles=`ls -a | grep -v -e"^\.$" -e"^\.\.$" -e"^\.git$" -e"gitattributes" -e"gitignore" -e"gitmodules" -e"README\.md" -e"bootstrap\.sh" -e"\.DS_Store"`
	mkdir -p $BACKUPFOLDER
	echo "$dotfiles" | xargs -I {} mv -f ~/{} $BACKUPFOLDER/{} 2>/dev/null
	echo "$dotfiles" | xargs -I {} rm -rf ~/{} 2>/dev/null
	echo "$dotfiles" | xargs -I {} ln -f -s $LINKEDDIR/{} ~/{}

	command -v git >/dev/null 2>&1 && git config --global include.path ~/.gitconfig-common
	mkdir -p ~/.vimbackup
	mkdir -p ~/.vimswap
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "Existing files will be moved to $BACKUPFOLDER. Proceed? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile
