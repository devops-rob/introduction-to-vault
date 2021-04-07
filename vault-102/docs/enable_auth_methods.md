---
id: enable_auth_methods
title: Enable Auth Methods
sidebar_label: Enable Auth Methods
---

Now that our pre-requisites are in place, we need to enable and configure two auth methods. In this example, we will use Okta and Userpass auth methods.

Firstly, we need to enable the Okta auth method.

```shell
vault auth enable okta
```

Next, we can configure the Okta auth method.  This example requires an Okta account to be created.  Developer accounts can be created for free on their [website.](https://developer.okta.com/signup/) Once you have an account and an API token, you will need to set the '**OKTA_ORG_NAME**' and '**OKTA_API_TOKEN**' environment variables.

```shell
vault write auth/okta/config \
   base_url="okta.com" \
   org_name=$OKTA_ORG_NAME \
   api_token=$OKTA_API_TOKEN
```

Now lets move on and enable the userpass auth method.

```shell
vault auth enable userpass
```

Next lets create a user in this auth method.

```shell
vault write auth/userpass/users/devopsrob \
    password=foo
```
