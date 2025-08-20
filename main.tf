terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.82.1"
    }
    keepass = {
      source  = "iSchluff/keepass"
      version = "1.0.1"
    }
  }
  required_version = "~> 1.13.0"
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
