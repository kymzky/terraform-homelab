terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.73.2"
    }
    keepass = {
      source  = "iSchluff/keepass"
      version = "1.0.1"
    }
  }
  required_version = "~> 1.11.0"
}
