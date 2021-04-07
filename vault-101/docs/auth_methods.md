---
id: auth_methods
title: Auth Methods
sidebar_label: Auth Methods
---

Auth methods are a mechanism within Vault that is responsible for authentication. Earlier on we talked about tokens being used to authenticate to Vault, which is one of the many supported auth methods. This auth method is enabled by default; however, the other auth methods will need to be enabled manually as required.

For example, we will enable the userpass auth method.  This allows users to log in with a username and password combination. To do this, run the following command in the terminal box below:

```shell script
vault auth enable userpass
```

Now the auth method has been enabled, we need to create users for them to be able to authenticate with Vault.  We can do this using the 'vault write' command. Enter the command below in the terminal box below:

```shell script
vault write auth/userpass/users/devopsrob password=password -policy=creds
```

In Vault, almost everything is path based. For example the command we have just run was done so against the 'auth/userpass/users/devopsrob' path. If you using the Vault API directly to interact with Vault, the URL would be constructed using the same path, which provides us with a single workflow no matter how we interact with Vault.

The auth method we have used in the example above is ok for smaller use cases, but it doesn't scale very well as more users are onboarded to Vault. This because for every user of Vault, an operator will need to enable the user by running the command above.

In these cases, it may be beneficial to enable other auth methods.  For example, we could enable and configure the LDAP auth method.  This would allow Vault to use LDAP or Active Directory as an identity provider and all user management can take place in those identity services.

We can enable as many auth methods as needed and principals can login to Vault using any of the enabled auth methods that they are configured to use.
