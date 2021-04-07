---
id: storage_backend
title: Vault Storage Backends
sidebar_label: Vault Storage Backends
---

Vault as a platform is made up of three parts.  The Vault API/https acts as frontend that principals will interact with. The Vault application itself is made up of multiple components as detailed in the diagram below. The storage backend is where Vault's encrypted data is stored.
This approach that decouples the frontend and application from the data store allows management of Vault in a stateless way.  

![vault layers](images/layers.png)

Currently, Vault supports 21 storage backends, from databases to key/value stores. Each option has its own pros and cons, and only some options support HA clustering.  For more information about the storage backend options, please check the official hashicorp documentation [here.](https://www.vaultproject.io/docs/configuration/storage#storage-stanza)

For this example, we are going to use the Raft integrated storage backend which takes a slightly different approach to majority of the storage backends, in that it couples the frontend with the storage backend.  The main benefit of this approach is there are less infrastructure components to manage.

Configuring Vault with the integrated Raft storage backend is done using the following configuration file:

```hcl
listener "tcp" {
  address         = "0.0.0.0:8200"
  tls_disable     = 1
}
storage "raft" {
  path    = "/raft"
  node_id = "raft_node_1"
}

disable_mlock = true
cluster_addr  = "http://127.0.0.1:8201"
api_addr      = "http://127.0.0.1:8200"
ui            = true
```

For more information on how to tailor this configuration file to your needs, refer to the [documentation.](https://www.vaultproject.io/docs/configuration/storage/raft)
