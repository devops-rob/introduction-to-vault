---
id: create_identity_group
title: Create identity group
sidebar_label: Create identity group
---

Create external identity group

```shell
group_id=$(vault write identity/group \
    name="tester" \
    type=external \
    policies=devops \
    -format=json | \
    jq -r .data.id
)
```

Create group alias

```shell
vault write identity/group-alias \
name="tester" \
mount_accessor=$okta_accessor \
canonical_id=$group_id
```
