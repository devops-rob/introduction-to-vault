---
id: rotating_keys
title: Rotating cryptographic keys
sidebar_label: Rotating cryptographic keys
---

Now that we have encrypted our plaintext, we can rotate the key using the following command.

```shell
vault write -f transit/keys/devopsrob/rotate
```

There are many reasons for rotating the keys but ultimately, it boils down to increasing your security posture.

