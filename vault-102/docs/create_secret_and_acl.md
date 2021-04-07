---
id: create_secret_and_acl
title: Create secret and ACL
sidebar_label: Create secret and ACL
---

For this demo, we need to create a secret to be placed in Vault, and an ACL policy to govern access to this secret.

The first step is to create a Vault policy.

```shell
policy='# Test policy
path "secret/+/*" {
  capabilities = ["create","read","update","delete","list"]
}'
```

Next, we need to write the policy to Vault.

```shell
echo $policy | vault policy write devops -
```

Now we can create a kv secret in Vault.

```shell
vault kv put secret/devops name=rob
```
