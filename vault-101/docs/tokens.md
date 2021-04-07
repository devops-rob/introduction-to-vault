---
id: tokens
title: Vault Tokens
sidebar_label: Vault Tokens
---

Tokens are the main authentication component within Vault. No matter what method is used to login to Vault, it results in a token being provided. As this is so core to the authentication piece in Vault, token authentication cannot be disabled.

The key thing about tokens is they are mapped to one or more policies, which governs what actions they are authorised to perform. Tokens also contain metadata about the token which are useful for audit logs, for example, creation time. Also, all tokens have a TTL associated with them, except the root token, which never expires and has to be revoked.

The root token we have been using up until now is the first token we can use in Vault when configuring.  As mentioned previously, a token with the root policy attached to it is a root token. 
Once Vault is configured, the idea is that the root token should be deleted and other tokens with fewer privileges be created according to the actions they need to perform. Once the root token is deleted, operators can still generate a new root token by running the following command:

```shell script
vault operator generate-root
```

This requires the minimum threshold of unseal keys as it's highly privileged access.

Tokens, depending on the type of token, can be created, renewed, revoked and much more.

### Token Types

Vault has 2 types of tokens that can be created, which are service tokens and batch tokens.

**Service Tokens**

Service tokens can be thought of as a full token which has the ability to do all the things mentioned above, including the creation of child tokens.  The root token for example falls into the category of a service token.

>Note: Service tokens from their inception are service tokens irrespective of what policies are mapped to them. Policies do not define what a service token is.

These token types are seen as more heavyweight as they can do more things and cost multiple storage writes per token creation.  The list below shows the ability of a service token:

- Can Be Root Tokens
- Can Create Child Tokens
- Can be Renewable
- Can be Periodic
- Can have Explicit Max TTL
- Has Accessors
- Has Cubbyhole
- Revoked with Parent (applies to non orphan tokens only)
- Dynamic Secrets Lease Assignment

**Batch Tokens**

Batch tokens are far more lightweight as there is no storage cost for token creation, however, this comes at the expense of capabilities. Batch tokens cannot do any of the actions listed above in the service token section.

To create a token with the creds policy attached, run the following command in the terminal below:

```shell script
vault token create -policy=creds
```

The above command creates a service token using the default ttl of Vault. 
Token behaviour can be far more granular than this. For example, we could:

- map more policies to it
- remove the default policy
- set a different ttl
- make the token an orphan
- make the token non-renewable
- create the token against a role
- make it a periodic

Tokens are a powerful component in Vault and are key to other auth methods that Vault offers, so let's take a look a what auth methods are.
