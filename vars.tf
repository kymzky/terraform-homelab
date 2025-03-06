variable "proxmox_ipv4_address" {
  default = "192.168.0.1"
}

variable "proxmox_node" {
  default = "proxmox"
}

variable "ssh_public_keys" {
  default = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM8BKHyZJQD8kh925tcQpHMAkob48O8FLwKyzZaIuyYc", # Macbook Pro
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPt5oGc1fv8IYC4ozvVMIxmMFrDsRgM5IzBExVyRl9Cx", # XPS13
  ]
}

variable "firewall_rules" {
  default = [
    {
      type    = "in"
      action  = "ACCEPT"
      dport   = "22"
      proto   = "tcp"
      log     = "info"
      comment = "SSH"
    },
    {
      type    = "in"
      action  = "ACCEPT"
      dport   = "53"
      proto   = "tcp"
      log     = "info"
      comment = "DNS"
    },
    {
      type    = "in"
      action  = "ACCEPT"
      dport   = "53"
      proto   = "udp"
      log     = "info"
      comment = "DNS"
    },
    {
      type    = "in"
      action  = "ACCEPT"
      dport   = "443"
      proto   = "tcp"
      log     = "info"
      comment = "HTTPS"
    },
    {
      type    = "in"
      action  = "ACCEPT"
      dport   = "6443"
      proto   = "tcp"
      log     = "info"
      comment = "k3s"
    },
    {
      type    = "in"
      action  = "ACCEPT"
      dport   = "10250"
      proto   = "tcp"
      log     = "info"
      comment = "Kubelet metrics"
    },
    {
      type    = "in"
      action  = "ACCEPT"
      dport   = "51820"
      proto   = "udp"
      log     = "info"
      comment = "VPN"
    }
  ]
}
