#!/bin/bash

# ANSI Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

TEST_FILE="test1.typ"
OUTPUT_FILE="/tmp/test-output.svg"

# Record the start time in nanoseconds
start_time=$(date +%s%N)

# Run the typst command and capture its output and exit code
output=$(typst compile "$TEST_FILE" "$OUTPUT_FILE" -f svg --root ../ 2>&1)
exit_code=$?

# Calculate elapsed time in milliseconds
end_time=$(date +%s%N)
elapsed_time_ms=$(( (end_time - start_time) / 1000000 ))

# Check the exit code
if [ $exit_code -eq 0 ]; then
  echo -e "${GREEN}PASS${NO_COLOR} All functions compiled successfully in ${elapsed_time_ms} ms."
  rm "$OUTPUT_FILE"
  exit 0
else
  echo "$output"
  echo -e "${RED}FAIL${NO_COLOR} Some functions are invalid."
  exit 1
fi