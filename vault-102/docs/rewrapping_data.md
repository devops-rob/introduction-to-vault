---
id: rewrapping_data
title: Rewrapping data
sidebar_label: Rewrapping data
---

In cases where we want our ciphertext to use the new version of the key, we can simply rewrap the ciphertext using the newest version of the key.

```shell
newciphertext=$(vault write transit/rewrap/devopsrob \
    ciphertext=$ciphertext \
    -format="json" | \
    jq -r .data.ciphertext)
```

We can examine the new ciphertext and we notice that the version of the key has been updated.

```shell
echo $newciphertext
```

Now that we have our ciphertext rewrapped using the new version of the key, lets go ahead and see if we can decrypt the new ciphertext with our new key version.

```shell
vault write transit/decrypt/devopsrob ciphertext=$newciphertext \
    -format="json" | jq -r .data.plaintext | \
    base64 -d
```
