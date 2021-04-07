---
id: decrypting_data
title: Decrypting data
sidebar_label: Decrypting data
---

Even with the key rotated, we can still decrypt the ciphertext. This is due to the key ring containing both versions of the key.

```shell
vault write transit/decrypt/devopsrob ciphertext=$ciphertext \
    -format="json" | jq -r .data.plaintext | \
    base64 -d
```
