---
id: policies
title: Vault Policies
sidebar_label: Vault Policies
---

Vault has three ways of managing permissions:
- ACLs (Vault Policies)
- Endpoint Governing Policies (EGPs)
- Role Governing Policies (RGPs)

The latter two are sentinel policies which is beyond the scope of what we are discussing today.  Sentinel is a Policy as Code product that HashiCorp offers.

Vault has two built-in policies, which are 'default' and 'root'.  The root policy is the one we have been using so far as we are using the root token.  This policy grants access to everything in vault.

The default policy is attached to all tokens in Vault.  We can look up the permissions it grants with the following command:

```shell script
vault read sys/policy/default
```

Vault policies are permissions documents, which are written in HCL (HashiCorp Configuration Language) or JSON.  Vault take a deny by default approach, so unless a principal has explicitly been granted permissions to perform an action in a Vault policy, Vault will deny the principal from performing that action.

The permissions that can be granted in a Vault policy are:

- create
- read
- update
- delete
- list
- sudo
- deny

As everything in Vault is path based, the permissions are given against a specific path.  We can create a Vault policy for the secret we stored in the KV secrets engine by writing the following the HCL syntax to a local file:

```shell script
cat >creds.hcl <<EOF
path "secret/creds" {
  capabilities = ["read","list"]
}
EOF
```

In the above example, we are giving read and list capabilities to the secrets/creds path. The capabilities value always needs to be a list of strings, even if it only contains a single capability.  Policies can be more granular than this example, for instance, we could sepcify allowed values or required parameters, but for this example, I want to keep it as simple as possible.

Now we have a Vault policy document, we need to write this to Vault to be able to start using it.  We can achieve this by writing the following command in the terminal below:

```shell script
vault policy write creds vault_policies/creds.hcl
```

The policy is now written to Vault and ready to be used.
