---
id: transit_secrets_engine
title: Transit Secrets Engine
sidebar_label: Transit Secrets Engine
---

In Vault, the Transit secrets engine is what is responsible for performing most cryptographic functions available in Vault. From, encryption and decryption to data signing.

### Enabling and configuring the Transit secrets engine

The key thing here is that it is a secrets engine so we need to enable it with the following command.

```shell
vault secrets enable transit
```

This command enables the Transit secrets engine at the 'transit' path in Vault.  This is important because everything in Vault is path based and the path will be required by developers when they want to leverage this in their applications.

We mentioned before that cryptography works with a combination of a cipher '(algorithm)' and a cryptographic key. Vault supports a number of different key types.  For a complete list of the supported key types, please refer to the [documentation.](https://www.vaultproject.io/docs/secrets/transit#key-types)

in order to create a cryptographic key, we need to run the following command.

```shell
vault write -f transit/keys/menta
```

This will create a key of the default type aes256-gcm96. If we want to create a key using a different key type, we can run the same command by add a key/value pair specifying the type. For example, we can create a new key called devopsrob of the type rsa-2048.

```shell
vault write -f transit/keys/devopsrob type=rsa-2048
```

Different platform architectures will require different setups.  Ideally, applications will not share cryptographic keys. Instead, we would setup a key per application. This gives us separation of concerns.
