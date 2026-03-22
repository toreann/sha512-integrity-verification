# Risk Analysis — SHA-512 Integrity Verification

## Overview

This document analyzes the risks associated with downloading and installing software without verification, and how SHA-512 checksum validation mitigates those risks.

---

## Identified Risks

### 1. Corrupted Downloads
Files may become corrupted during download due to network issues or incomplete transfers.

**Impact:**
- Installation failures
- Unstable software behavior

---

### 2. Tampered Files (Integrity Risk)
An attacker may modify a file during transfer (e.g., man-in-the-middle attack).

**Impact:**
- Malicious code execution
- System compromise

---

### 3. Supply Chain Attacks
A compromised distribution source could provide altered software along with modified checksums.

**Impact:**
- Installation of backdoored or malicious software
- Data exfiltration or persistence mechanisms

---

## Mitigation — SHA-512 Verification

### Control Implemented
SHA-512 checksum verification using:
- `sha512sum`
- `sha512sum -c`
- Bash automation scripts

### What It Protects Against

- Detects corrupted downloads
- Detects unauthorized file modifications
- Ensures file integrity matches the expected version

---

## Limitations

SHA-512 verification only ensures **integrity**, not **authenticity**.

### Key Limitation
If an attacker can modify both:
- the downloaded file
- the published checksum

the verification will still pass.

---

## Stronger Controls (Recommended)

To improve security beyond integrity checks:

- Use digital signatures (e.g., GPG)
- Download software only from trusted sources (HTTPS, official websites)
- Validate sources using vendor documentation

---

## Risk Summary

| Risk | Mitigated by SHA-512 | Residual Risk |
|------|---------------------|--------------|
| Corrupted downloads | Yes | Low |
| File tampering | Yes | Low |
| Supply chain attacks | Partial | Medium |

---

## Conclusion

SHA-512 verification is an effective baseline control for ensuring file integrity before installation. While it significantly reduces the risk of corrupted or tampered downloads, it should be combined with authenticity mechanisms (such as digital signatures) for stronger security in high-risk environments.
