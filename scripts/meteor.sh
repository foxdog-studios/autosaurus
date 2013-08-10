#!/usr/bin/bashir

set -o errexit
set -o nounset

cd ../autosaur

if [[ "${#}" == 0 ]]; then
    args=run
else
    args="${@}"
fi

mrt ${args[@]}

