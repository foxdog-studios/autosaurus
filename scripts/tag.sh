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
cd -- "${REPO}"

if [[ ! $(git status | grep 'working directory clean') ]]; then
    echo 'Uncommited changes, aborting!'
    exit 1
fi

echo "Previous tag is sort of this $(git describe)"

read -p "Enter your new tag: " -r
tag="${REPLY}"
read -p "Enter a message to go with the tag: " -r
message="${REPLY}"

git tag -s "${tag}" -m "${message}"

