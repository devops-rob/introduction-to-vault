---
id: audit_devices
title: Audit Devices
sidebar_label: Audit Devices
---

All authenticated requests and responses to Vault are logged, including error messages. These logs provide details in order for thorough audits of interactions with Vault to be conducted. It also provides breadcrumbs for any post incident investigation should it be required.

The component within Vault that is responsible for capturing these logs is called an Audit device. Audit logs are captured in JSON format, which makes it simple for external log aggregation platforms to consume this log data. As the data contained within these logs will more often than not be sensitive, all strings are hashed using HMAC-SHA256.

Audit devices need to be enabled before any logs are captured.  Once enabled, Vault needs to be able to write to the log in order to function. In any instance where Vault cannot write to a log, Vault will stop responding to requests until it can write to the log. This is by design to ensure attacks can not occur when logging is not working. With this in mind, it is best practice to enable more than one audit device. Should one device stop writing, it will not cause any downtime.

There are three types of Audit devices in Vault.

- Socket
- File
- Syslog

To enable the file audit log for example, run the following command.

```shell
vault audit enable file file_path=/files/vault.log
```

You can enable multiple of the same or different audit devices to adhere to best practice. For the file audit device, it would be advisable to write a secondary audit device to a second disk mounted to Vault.  This is so that, if one disk fails or becomes full, the other can still be written to whilst operators remedy the issue with any downtime.
