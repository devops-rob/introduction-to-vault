---
id: create_entity
title: Create entity
sidebar_label: Create entity
---

Each auth method that is enabled has a unique mount accessor ID associated with it.  This is due to the facts that multiple auth methods of the same type can be enabled at differents paths on a single Vault deployment.  In order to create an entity and associated aliases, we need to know what the mount accessot IDs are.

Look up the mount_accessor for the okta auth method and note value

```shell
okta_accessor=$(vault auth list -format=json | \
jq -r '."okta/".accessor')
```

Look up the mount_accessor for the userpass auth method and note value

```shell
userpass_accessor=$(vault auth list -format=json | \
jq -r '."userpass/".accessor')
```

Next step is to create an entity. We will need the canonical ID for the next part.  This is a unique identifer for the entity.

```shell
canonical_id=$(vault write identity/entity \
    name=devopsrob \
    -format=json | \
    jq -r .data.id)
```

Now we can create an alias for Okta. The name must match the username of the Okta user.

```shell
vault write identity/entity-alias name=demolabs@devopsrob.com \
    mount_accessor=$okta_accessor \
    canonical_id=$canonical_id
```

We will do the same to create alias for userpass. Again, the name must match the username in the auth method.

```shell
vault write identity/entity-alias name=devopsrob \
    mount_accessor=$userpass_accessor \
    canonical_id=$canonical_id
```
