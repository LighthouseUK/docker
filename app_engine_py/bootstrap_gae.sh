#!/usr/bin/bash

DEFAULT_SRC_DIR="$HOME/app/src"
DEFAULT_GAE_SERVER="/usr/local/google_appengine/dev_appserver.py"

SRC_DIR="${GAE_APP_PATH:-$DEFAULT_SRC_DIR}"
GAE_SERVER="${GAE_DEV_SERVER:-$DEFAULT_GAE_SERVER}"

function join { local IFS="$1"; shift; echo "$*"; }

function get_configs {
	yaml_files=($(ls ${SRC_DIR}/*.yaml))
	for (( i = 0 ; i < ${#yaml_files[@]} ; i++ )) do
		if [[ "${yaml_files[$i]}" == "${SRC_DIR}/dispatch.yaml" ]]; then
			dispatch_index=$i
		fi
		if [[ "${yaml_files[$i]}" == "${SRC_DIR}/index.yaml" ]]; then
			index_index=$i
		fi
	done

	if [ -n "$index_index" ]; then
		unset yaml_files[index_index]
	fi

	if [ -n "$dispatch_index" ]; then
		dispatch_file="${yaml_files[$dispatch_index]}"
		unset yaml_files[dispatch_index]
		join ' ' $dispatch_file "${yaml_files[@]}"
	else
		join ' ' "${yaml_files[@]}"
	fi
}

# TODO: Modify this to take a command line arg for project name/mount point path. Also use the CONFIG_PATH variable
function link_mounted_storage {
	if [ ! -h "$SRC_DIR" ]; then
		ln -s /src/demo_app "$SRC_DIR"
	fi
}

function install_requirements {
	[ -f "$SRC_DIR/requirements.txt" ] && pip install -r "$SRC_DIR/requirements.txt"
}

function bootstrap_gae {
	link_mounted_storage
	
	install_requirements

	yaml_files=$(get_configs)

	$GAE_SERVER "$@" $yaml_files
}

RUNNING="$(basename $0)"

if [[ "$RUNNING" == "bootstrap_gae.sh" ]]
then
  bootstrap_gae "$@"
fi