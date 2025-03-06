# terraform-homelab

This project is used for creating three VMs on Proxmox with Terraform. The VMs
can be provisioned to create a Kubernetes cluster afterwards using Ansible (see
[ansible-homelab](https://github.com/kymzky/ansible-homelab)).

## Requirements

### KeePass

The creation of the VMs in [`virtual_machines.tf`](./virtual_machines.tf)
requires a KeePass database to set the user credentials.
An entry is expected for each VM under the path **Database/Homelab/\$VM_NAME**.

To set the path to the database and the password execute:

```console
export KEEPASS_DATABASE=/path/to/database
export KEEPASS_PASSWORD='secret'
```
