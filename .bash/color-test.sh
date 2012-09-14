#!/usr/bin/env bash

for i in {0..255}; do
	echo -n $(tput bold; tput setaf $i)$i
	echo -ne "\t"
	[ $(($i % 16)) -eq 0 ] && echo
done

echo $(tput sgr0)
