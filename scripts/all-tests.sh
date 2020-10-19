#!/bin/bash

echo "Downloading the test list"
tests=()
while IFS= read -r line; do
    tests+=( "$line" )
done < <( make list )

for i in "${tests[@]}"
do
    echo "Running test : $i"
	TEST_TO_RUN="$i" make test
done