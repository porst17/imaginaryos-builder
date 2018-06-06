#!/usr/bin/env bash

set -x

export SCRIPT_DIR="$( cd "$( echo "${BASH_SOURCE[0]%/*}/" )"; pwd )"
export BUILD_DIR="$SCRIPT_DIR/build"

mkdir -p $BUILD_DIR
cd $SCRIPT_DIR

# run all scripts starting with 4 digits in sorted order
SCRIPTS=$( ls -1 scripts/[0-9][0-9][0-9][0-9]_*.sh | sort )
for f in $SCRIPTS; do source $f; done
