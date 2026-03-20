#!/bin/bash

# Simple SHA-512 verification script
# Usage:
# ./verify.sh <filename> <expected_sha512>"

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <filename> <expected_sha512>"
  exit 1
fi

FILE="$1"
EXPECTED="$2"

if [ ! -f "$FILE" ]; then
  echo "Error: file '$FILE' not found."
  exit 1
fi

ACTUAL=$(sha512sum "$FILE" | awk '{print $1}')

echo "Expected: $EXPECTED"
echo "Actual:   $ACTUAL"

if [ "$ACTUAL" = "$EXPECTED" ]; then
  echo "Result: SHA-512 hash matches. File integrity verified."
  exit 0
else
  echo "Result: Hash mismatch. Do not install this file."
  exit 2
fi
