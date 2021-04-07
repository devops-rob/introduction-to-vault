---
id: secrets_engines
title: Secrets Engines
sidebar_label: Secrets Engines
---

In Vault, secrets engines is the component responsible for managing secrets whether it's static or dynamic.  By default, the Cubbyhole secrets engine is enabled in Vault. I'll speak in more detail about that later on in the workshop.

For now, lets look at the KV secrets engine, which is a key/value store used for storing static secrets.

There are two versions of the KV secrets engine, version 1 and version 2.  The main difference between them is that version 2 supports versioning of secrets.  This means that secrets that are rotated can still store previous versions and can still be accessed by authorised principals. Version is the secrets engine that is enabled by default.

The first thing we need to do is enable this secrets engine with the following command:

```shell script
vault secrets enable -version=2 -path=secret kv
```

Lets store a secret in the kv secrets engine. Enter the following command in the terminal below:

```shell script
vault kv put secret/creds passcode=devopsrob
```

We can verify that the secret has been stored in the secrets/creds path by running the following command in the terminal below:

```shell script
vault kv get secret/creds
```

We can create a new version of the secret by running the same command but changing the key/value details in the terminal below:

```shell script
vault kv put secret/creds passcode=menta
```

Now if we run the get command again, we will see a new version of the secret.

```shell script
vault kv get secret/creds
```

To see a previous version we can pass the same command with the version flag like this:

```shell script
vault kv get -version=1 secret/creds
```

### Dynamic Secrets Engines

In addition to the KV secrets engine, Vault supports a wide range of dynamic secrets engines.  These secrets engines are responsible for provisioning and de-provisioning credentials for third party platforms.

The main benefit of this is, secrets are only provisioned when they are requested and de-provisioned when the TTL expires automatically.

Let's look at an example of this using the RabbitMQ secrets engine.  The first thing we need to do is enable it with the following command in the terminal box below:

```shell script
vault secrets enable rabbitmq
```

With that enabled, we now need to tell Vault how to connect to RabbitMQ by configuring the connection details using the following command in the terminal below:

```shell script
vault write rabbitmq/config/connection \
    connection_uri="http://rabbitmq.container.shipyard.run:15672" \
    username="guest" \
    password="guest"
```

Vault will need a high privileged account to manage RabbitMQ users so in this example we are giving Vault an Admin user.

Now we need to configure a role.  A role is the component in the secrets engine that guides the permissions of the provisioned credentials. This could be an admin role, which will provision credentials with admin permissions, or a read-only role for example.  The permissions structure is dependent on the client platform.

In this example, RabbitMQ uses Virtual hosts to permissions against.  We can create the role by running the following command in the terminal below:

```shell script
vault write rabbitmq/roles/admin \
    vhosts='{"/":{"write": ".*", "read": ".*"}}'
```

We can create as many roles as required for different levels of access. Now we can test the role by asking Vault to generate a RabbitMQ credential with the following command in the terminal box below:

```shell script
vault read rabbitmq/creds/admin
```

When reading credentials, the path structure follows this pattern:

'secrets_engine_mount_path/creds/role_name'.

Now the secrets engine is configured, we need to control who has authorization to read secrets from this path.  We can do this using Vault Policies.
