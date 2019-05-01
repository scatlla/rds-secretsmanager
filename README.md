# rds-secretsmanager

First, create a secret in AWS Secrets Manager.
You can do this via the console, CLI, Terraform, CFT, etc.
The key here is to create separately, i.e. not as a part of any CFT that may use it later.
I did it Terraform, as can be seen [here](/secretsmanager/ssm.tf).


Then, create an RDS resource that uses the stored secret password when provisioning.
I did this in CFT, as can he seen [here](/rds/rds.template).
