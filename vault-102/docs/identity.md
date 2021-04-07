---
id: identity
title: Identity Secrets Engine
sidebar_label: Identity Secrets Engine
---

Vault supports a number of different [Auth methods,](https://www.vaultproject.io/docs/auth) from LDAP to OKTA. This allows us to bring our own Identity Providers (IDP). Whilst this unlocks a lot of possibilities for managing Identity and Access at scale, it also introduces some complexity.

An entity could have an account in Okta, as well as a local account in Vault. The challenge presented here is that we need to manage permissions for each account should both of these auth methods be enabled and available for them to authenticate with.

To solve this challenege, Vault has the identity secrets engine. This allows us to create entities and aliases for different entity accounts. In the example I just mentioned, an entity would have an Okta alias as well as a userpass alias. That way we can apply policies to the entity and it won't matter what account they log in with, they will still obtain the correct policies attached to their vault token.

The Identity secrets engine is different because it is enabled by default and cannot be disabled.
