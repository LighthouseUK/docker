#!/usr/bin/bash

function git_init {
	ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
	# exec ssh-agent /bin/bash 
	eval "$(ssh-agent /bin/bash)"
	ssh-add ~/.ssh/id_rsa
	cat ~/.ssh/id_rsa.pub
	git config --global user.name "$1"
	git config --global user.email "$2"
}

RUNNING="$(basename $0)"

if [[ "$RUNNING" == "git_init.sh" ]]
then
  git_init "$@"
fi