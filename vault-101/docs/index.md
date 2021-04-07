---
id: index
title: Introduction to HashiCorp Vault
sidebar_label: Introduction to HashiCorp Vault
---

HashiCorp Vault is a centralised secrets management platform designed to stop secrets and credentials from being sprawled. Without such a platform, secrets tend to end up in multiple places which makes it difficult to control who has access to the, audit their uses and it widens the attack surface. Vault being a centralised platform means that everything and everyone goes to the same place to interact with secrets.

Vault Operates in three main areas.

- **Secrets store** - Vault acts as a storage facility for static secrets.  All secrets stored in vault are encrypted at rest.
- **Identity broker** - Vault can also act as an identity broker for a number of platforms, from cloud providers to databases. Rather than storing access credentials for this platform in Vault, trust can instead be delegated to Vault to create short lived credentials on demand within the respective platforms when requested by authorised entities. Once the credential expires, Vault will delete it from the respective platform.
- **Encryption as a Service** - Vault also offers Cryptographic functions as a service with in built key management, data encryption / decryption, data signing and HMAC.

### Interacting with Vault

Vault is API driven and as such, has full API support for all actions.  In addition to this, there are also a number of HashiCorp supported and community supported client libraries which act as a wrapper around the API.  Secret consumers also have the option of using the CLI which is also a wrapper around the API. Finally, Vault has a web User Interface but this has limited functionality.
