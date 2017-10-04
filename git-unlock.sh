#!/usr/bin/env bash
# "git unlock", a custom command for git.

set -o errexit
set -o pipefail
set -o nounset

readonly lock_ref_regex='(?<=error: cannot lock ref '\'').*(?='\'': is at )'

# Executes a "git fetch" command to find errors
echo "Fetching..."
_result=$(git fetch 2>&1)

# Search for all references with locked refs
_errors=($(echo "${_result}" | grep -q --only-matching --perl-regexp "${lock_ref_regex}" || true))

# If any, delete the locked refs
if [ ${#_errors[@]} -gt 0 ]
then
	for ref in "${_errors[@]}"
	do
		echo "Deleting reference '$ref'"
		git update-ref -d "${ref}"
	done
else
	echo "No problems found."
fi
