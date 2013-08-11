#!/usr/bin/bashir

set -o errexit
set -o nounset

cd ../autosaurus

if [[ "${#}" == 0 ]]; then
    args=run
else
    args="${@}"
fi

mrt ${args[@]}

