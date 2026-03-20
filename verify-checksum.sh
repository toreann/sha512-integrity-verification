#!/bin/bash

# Verify file using a .sha512 checksum file

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <checksum_file.sha512>"
  exit 1
fi

CHECKSUM_FILE="$1"

if [ ! -f "$CHECKSUM_FILE" ]; then
  echo "Error: checksum file not found."
  exit 1
fi

echo "Running SHA-512 verification using checksum file..."
sha512sum -c "$CHECKSUM_FILE"

if [ $? -eq 0 ]; then
  echo "Verification successful: File integrity confirmed."
else
  echo "Verification failed: File may be corrupted or tampered."
fi
