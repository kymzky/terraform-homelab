terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.73.0"
    }
    keepass = {
      source  = "iSchluff/keepass"
      version = "1.0.0"
    }
  }
  required_version = "~> 1.10.0"
}

provider "proxmox" {
  endpoint = "https://${var.proxmox_ipv4_address}:8006/"
  username = "${data.keepass_entry.proxmox.username}@pam"
  password = data.keepass_entry.proxmox.password
  insecure = true
}

data "keepass_entry" "proxmox" {
  path = "Database/Homelab/proxmox"
}
