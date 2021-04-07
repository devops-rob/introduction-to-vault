---
id: encrypting_data
title: Encrypting  data
sidebar_label: Encrypting data
---

Now that we have created some keys, we can now use them to perform cryptographic functions.  Lets start with the most basic function, which is to encrypt some data.  A pre-requisite in the Transit secrets engine to encrypt data is that it needs to be base64 encoded. This is a really common encoding protocol and is widely available in the form of libraries and packages across most programming and scripting languages. Below we are using the bash base64 package to to form this function.

```shell
plaintext=$(echo "Subscribe to my YouTube channel - youtube.com/devopsrob" | base64)
```

We can print this variable out just to confirm it has infact, base64 encoded our plaintext.

```shell
echo $plaintext
```

Now that the pre-requisite has been fulfilled, we can now go ahead and encrypt this piece of data using out key in Vault.

```shell
ciphertext=$(vault write transit/encrypt/devopsrob plaintext=$plaintext -format="json" | jq -r .data.ciphertext)
```

The response gives us two things. The first being the ciphertext.  This is the encrypted value and is what we would place on our message queues, store in our database or whatever way that data is to be consumed.  The second thing it gives us is the key version that we are using.  In our case this is the first version of the key.  Should we rotate this key, then the version will change incrementally.
