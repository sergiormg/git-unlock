#!/usr/bin/env bash
# "git unlock", a custom command for git.

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

readonly lock_ref_regex='(?<=error: cannot lock ref '\'').*(?='\'': is at )'

# Executes a "git pull" command to find errors
_pull=$(git pull 2>&1)

# Search for all references with locked refs and delete them
echo "${_pull}" | grep --only-matching --perl-regexp "${lock_ref_regex}" | while read -r ref ; do
    echo "Deleting reference '$ref'"
	git update-ref -d "${ref}"
done