# SHA-512 Integrity Verification

## Overview

This project demonstrates how to verify the integrity of downloaded software on Linux using SHA-512.

It includes both manual and automated verification methods, based on the type of checksum information provided by the vendor. In this project, I used a Splunk package as a real-world example and documented the full process with screenshots.

* Scripts available at the repo

## Objectives

* Verify downloaded software before installation
* Understand the difference between manual and automated checksum validation
* Practice secure software handling on Linux
* Reduce the risk of installing corrupted or modified files

## Tools Used

* Linux
* `sha512sum`
* Bash
* Splunk package and vendor-provided checksum file

## Verification Methods

1. Manual verification using "sha512sum"
2. Automatic Linux verification using "sha512sum -c"
3. Scripted manual verification using "verify.sh"
4. Scripted checksum-file verification using "verify-checksum.sh"


### Method 1 - Manual verification
This method is used when a vendor provides only a raw SHA-512 hash value.

```Command
sha512sum <filename>
Example
sha512sum splunk-10.2.1-c892b66d163d-linux-amd64.deb```
- How It Works
- This command calculates the SHA-512 hash of the specified file and prints it in the terminal. The output must then be compared manually with the expected hash published by the vendor.

- Example Output
- 71a5b34618a90e38d953448d39f67b019b5b6157fb2e9d1fb09cbaf2497f7520ad15b345db35d875f9ab0bb44b5070746ede32d695c24e4ffc0783d412018183  splunk-10.2.1-c892b66d163d-linux-amd64.deb
---
- This method works even when no checksum file is provided
- It requires manual comparison
---

### Method 2 - Automatic verification
This method can be used when the vendor provides a .sha512 checksum file

```Command
sha512sum -c <file.sha512>
Example
sha512sum -c splunk-10.2.1-c892b66d163d-linux-amd64.deb.sha512```
- How it Works
- The .sha512 file contains the expected SHA-512 hash and the exact filename it should match. The -c option tells sha512sum to read that file, calculate the hash of the target file automatically, and compare the results.

- Example Output
- splunk-10.2.1-c892b66d163d-linux-amd64.deb: OK
---
- This is the best standard method when a checksum file is available
---

### Method 3 - Scripted Manual Verification
This script automates manual verification when only a raw SHA-512 hash is available

```Usage
./verify.sh <filename> "<expected_sha512>"
Example
./verify.sh splunk-10.2.1-c892b66d163d-linux-amd64.deb "71a5b34618a90e38d953448d39f67b019b5b6157fb2e9d1fb09cbaf2497f7520ad15b345db35d875f9ab0bb44b5070746ede32d695c24e4ffc0783d412018183"```

- This script calculates the hash of the target file and compares it with the expected hash value entered by the user.
---
- Useful when the vendor does not provide a checksum file
---

The goal of this project is to show practical security awareness, Linux command-line usage and understanding checksum-based integrity verification in real-world software handling.
