#!/bin/bash

set -o errexit
set -o nounset

usage()
{
    echo "


    Usage:

        # $(basename "${0}") [-]
"
    exit 1
}

while getopts : opt; do
    case "${opt}" in
        \?|*) usage ;;
    esac
done
unset opt

shift $(( OPTIND - 1 ))

if [[ "${#}" != 0 ]]; then
    usage
fi
unset usage

REPO=$(realpath "$(dirname "$(realpath -- "${BASH_SOURCE[0]}")")/..")

cd /tmp

git clone git@github.com:foxdog-studios/autosaurus.git

readonly TMP_AUTOSAURUS='/tmp/autosaurus'

trap "rm -rf ${TMP_AUTOSAURUS}" EXIT

cd autosaurus

npm install
bower install

grunt copy

cd "${REPO}"


cp -v "${TMP_AUTOSAURUS}/index.html" .
cp -v ${TMP_AUTOSAURUS}/build/* build/

exit 0

