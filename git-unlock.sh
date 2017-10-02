#!/bin/bash

# Execute a "git pull" command to find errors
PULL_RESULT=$(git pull 2>&1)

# Search for all references with locked refs and delete them
echo "$PULL_RESULT" | grep -o -P '(?<=error: cannot lock ref '\'').*(?='\'': is at )' | while read -r ref ; do
    echo "Deleting reference '$ref'"
	git update-ref -d $ref
done